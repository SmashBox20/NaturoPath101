import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

/// Interaction severity levels
enum InteractionSeverity {
  minor,
  moderate,
  major,
  contraindicated,
}

/// Medication stored in Medicine Cabinet
class Medication {
  final String id;
  final String name;
  final List<String> activeIngredients;
  final String? rxNormCode;
  final String? dosage;
  final String? frequency;
  final String? purpose;
  final DateTime addedDate;

  Medication({
    required this.id,
    required this.name,
    required this.activeIngredients,
    this.rxNormCode,
    this.dosage,
    this.frequency,
    this.purpose,
    required this.addedDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'activeIngredients': activeIngredients,
        'rxNormCode': rxNormCode,
        'dosage': dosage,
        'frequency': frequency,
        'purpose': purpose,
        'addedDate': addedDate.toIso8601String(),
      };

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        id: json['id'],
        name: json['name'],
        activeIngredients: List<String>.from(json['activeIngredients']),
        rxNormCode: json['rxNormCode'],
        dosage: json['dosage'],
        frequency: json['frequency'],
        purpose: json['purpose'],
        addedDate: DateTime.parse(json['addedDate']),
      );
}

/// Drug-herb interaction information
class Interaction {
  final String plantId;
  final String plantName;
  final String medication;
  final InteractionSeverity severity;
  final String mechanism;
  final String recommendation;
  final List<String>? references;

  Interaction({
    required this.plantId,
    required this.plantName,
    required this.medication,
    required this.severity,
    required this.mechanism,
    required this.recommendation,
    this.references,
  });

  String get severityDisplay {
    switch (severity) {
      case InteractionSeverity.minor:
        return 'Minor';
      case InteractionSeverity.moderate:
        return 'Moderate';
      case InteractionSeverity.major:
        return 'Major';
      case InteractionSeverity.contraindicated:
        return 'Contraindicated';
    }
  }

  Map<String, dynamic> toJson() => {
        'plantId': plantId,
        'plantName': plantName,
        'medication': medication,
        'severity': severity.toString(),
        'mechanism': mechanism,
        'recommendation': recommendation,
        'references': references,
      };

  factory Interaction.fromJson(Map<String, dynamic> json) => Interaction(
        plantId: json['plantId'],
        plantName: json['plantName'],
        medication: json['medication'],
        severity: InteractionSeverity.values.firstWhere(
          (e) => e.toString() == json['severity'],
        ),
        mechanism: json['mechanism'],
        recommendation: json['recommendation'],
        references: json['references'] != null
            ? List<String>.from(json['references'])
            : null,
      );
}

/// Service for managing Medicine Cabinet (Premium feature)
/// 
/// This service handles:
/// - Encrypted local storage of medications
/// - Drug-herb interaction checking
/// - Optional cloud sync (requires user consent)
class MedicineCabinetService {
  static const String _storageKeyMedications = 'medicine_cabinet_medications';
  static const String _storageKeyConsent = 'medicine_cabinet_cloud_consent';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  /// Get all medications from secure storage
  Future<List<Medication>> getMedications() async {
    try {
      final String? medicationsJson = await _secureStorage.read(
        key: _storageKeyMedications,
      );

      if (medicationsJson == null) {
        return [];
      }

      final List<dynamic> decoded = jsonDecode(medicationsJson);
      return decoded.map((json) => Medication.fromJson(json)).toList();
    } catch (e) {
      // Log error (implement logging service)
      print('Error loading medications: $e');
      return [];
    }
  }

  /// Add a medication to the cabinet
  Future<void> addMedication(Medication medication) async {
    try {
      final medications = await getMedications();
      medications.add(medication);
      await _saveMedications(medications);
    } catch (e) {
      print('Error adding medication: $e');
      rethrow;
    }
  }

  /// Update an existing medication
  Future<void> updateMedication(Medication medication) async {
    try {
      final medications = await getMedications();
      final index = medications.indexWhere((m) => m.id == medication.id);

      if (index != -1) {
        medications[index] = medication;
        await _saveMedications(medications);
      }
    } catch (e) {
      print('Error updating medication: $e');
      rethrow;
    }
  }

  /// Remove a medication from the cabinet
  Future<void> removeMedication(String medicationId) async {
    try {
      final medications = await getMedications();
      medications.removeWhere((m) => m.id == medicationId);
      await _saveMedications(medications);
    } catch (e) {
      print('Error removing medication: $e');
      rethrow;
    }
  }

  /// Clear all medications (secure deletion)
  Future<void> clearAllMedications() async {
    try {
      await _secureStorage.delete(key: _storageKeyMedications);
    } catch (e) {
      print('Error clearing medications: $e');
      rethrow;
    }
  }

  /// Save medications to secure storage
  Future<void> _saveMedications(List<Medication> medications) async {
    final String medicationsJson = jsonEncode(
      medications.map((m) => m.toJson()).toList(),
    );
    await _secureStorage.write(
      key: _storageKeyMedications,
      value: medicationsJson,
    );
  }

  /// Check interactions between medications and a plant
  /// 
  /// This is a stub - actual implementation would call API
  /// to check interactions against a database
  Future<List<Interaction>> checkInteractions({
    required String plantId,
    List<Medication>? medications,
  }) async {
    // TODO: Implement API call to interaction checking service
    // For now, return empty list
    // 
    // In production:
    // 1. Get medications from storage if not provided
    // 2. Call API with plant ID and medication list
    // 3. Parse response and return Interaction objects
    
    final meds = medications ?? await getMedications();
    
    // Stub implementation - replace with actual API call
    // Example API call:
    // final response = await http.post(
    //   Uri.parse('${apiUrl}/interactions/check'),
    //   headers: {'Authorization': 'Bearer $token'},
    //   body: jsonEncode({
    //     'plantId': plantId,
    //     'medications': meds.map((m) => {
    //       'name': m.name,
    //       'activeIngredients': m.activeIngredients,
    //       'rxNormCode': m.rxNormCode,
    //     }).toList(),
    //   }),
    // );
    
    return [];
  }

  /// Check interactions for multiple plants
  Future<Map<String, List<Interaction>>> checkMultipleInteractions({
    required List<String> plantIds,
  }) async {
    // TODO: Implement batch interaction checking
    final Map<String, List<Interaction>> results = {};

    for (final plantId in plantIds) {
      results[plantId] = await checkInteractions(plantId: plantId);
    }

    return results;
  }

  /// Get cloud sync consent status
  Future<bool> getCloudSyncConsent() async {
    final String? consent = await _secureStorage.read(
      key: _storageKeyConsent,
    );
    return consent == 'true';
  }

  /// Set cloud sync consent
  Future<void> setCloudSyncConsent(bool consent) async {
    await _secureStorage.write(
      key: _storageKeyConsent,
      value: consent.toString(),
    );

    if (consent) {
      // TODO: Implement cloud sync initialization
      // 1. Upload current medications to cloud (encrypted)
      // 2. Set up sync listeners
    } else {
      // TODO: Implement cloud sync disable
      // 1. Delete medications from cloud
      // 2. Disable sync listeners
    }
  }

  /// Export medications data (for sharing with healthcare provider)
  /// Returns JSON string
  Future<String> exportMedications() async {
    final medications = await getMedications();
    return jsonEncode({
      'exportDate': DateTime.now().toIso8601String(),
      'medications': medications.map((m) => m.toJson()).toList(),
    });
  }

  /// Import medications data
  Future<void> importMedications(String jsonData) async {
    try {
      final Map<String, dynamic> data = jsonDecode(jsonData);
      final List<dynamic> medicationsJson = data['medications'];
      final medications = medicationsJson
          .map((json) => Medication.fromJson(json))
          .toList();

      await _saveMedications(medications);
    } catch (e) {
      print('Error importing medications: $e');
      rethrow;
    }
  }
}
