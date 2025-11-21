import 'package:flutter/foundation.dart';

/// Model for Medicine Cabinet items
class MedicineCabinetItem {
  final String id;
  final String plantId;
  final String plantName;
  final String form;
  final String? brand;
  final String? dosage;
  final String? frequency;
  final String? purpose;
  final DateTime addedDate;
  final DateTime? expirationDate;
  final String? notes;
  int? effectivenessRating;

  MedicineCabinetItem({
    required this.id,
    required this.plantId,
    required this.plantName,
    required this.form,
    this.brand,
    this.dosage,
    this.frequency,
    this.purpose,
    required this.addedDate,
    this.expirationDate,
    this.notes,
    this.effectivenessRating,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plantId': plantId,
      'plantName': plantName,
      'form': form,
      'brand': brand,
      'dosage': dosage,
      'frequency': frequency,
      'purpose': purpose,
      'addedDate': addedDate.toIso8601String(),
      'expirationDate': expirationDate?.toIso8601String(),
      'notes': notes,
      'effectivenessRating': effectivenessRating,
    };
  }

  factory MedicineCabinetItem.fromJson(Map<String, dynamic> json) {
    return MedicineCabinetItem(
      id: json['id'] as String,
      plantId: json['plantId'] as String,
      plantName: json['plantName'] as String,
      form: json['form'] as String,
      brand: json['brand'] as String?,
      dosage: json['dosage'] as String?,
      frequency: json['frequency'] as String?,
      purpose: json['purpose'] as String?,
      addedDate: DateTime.parse(json['addedDate'] as String),
      expirationDate: json['expirationDate'] != null
          ? DateTime.parse(json['expirationDate'] as String)
          : null,
      notes: json['notes'] as String?,
      effectivenessRating: json['effectivenessRating'] as int?,
    );
  }

  bool get isExpiringSoon {
    if (expirationDate == null) return false;
    final daysUntilExpiration =
        expirationDate!.difference(DateTime.now()).inDays;
    return daysUntilExpiration <= 30 && daysUntilExpiration >= 0;
  }

  bool get isExpired {
    if (expirationDate == null) return false;
    return expirationDate!.isBefore(DateTime.now());
  }
}

/// Service for managing the Medicine Cabinet
class MedicineCabinetService extends ChangeNotifier {
  final List<MedicineCabinetItem> _items = [];

  List<MedicineCabinetItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  /// Add an item to the medicine cabinet
  void addItem(MedicineCabinetItem item) {
    _items.add(item);
    notifyListeners();
  }

  /// Remove an item from the medicine cabinet
  void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  /// Update an item's effectiveness rating
  void updateEffectivenessRating(String itemId, int rating) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _items[index].effectivenessRating = rating;
      notifyListeners();
    }
  }

  /// Get items expiring soon
  List<MedicineCabinetItem> get itemsExpiringSoon {
    return _items.where((item) => item.isExpiringSoon).toList();
  }

  /// Get expired items
  List<MedicineCabinetItem> get expiredItems {
    return _items.where((item) => item.isExpired).toList();
  }

  /// Get active (non-expired) items
  List<MedicineCabinetItem> get activeItems {
    return _items.where((item) => !item.isExpired).toList();
  }

  /// Check if plant is already in cabinet
  bool hasPlant(String plantId) {
    return _items.any((item) => item.plantId == plantId);
  }

  /// Get items by plant ID
  List<MedicineCabinetItem> getItemsByPlant(String plantId) {
    return _items.where((item) => item.plantId == plantId).toList();
  }

  /// Clear all items (for testing/demo purposes)
  void clearAll() {
    _items.clear();
    notifyListeners();
  }

  /// Load sample data for demonstration
  void loadSampleData() {
    // Sample items for demonstration
    final sampleItems = [
      MedicineCabinetItem(
        id: 'item-001',
        plantId: 'plant-002',
        plantName: 'Valerian',
        form: 'Tincture',
        brand: "Nature's Way",
        dosage: '2ml',
        frequency: 'Before bedtime',
        purpose: 'Sleep support',
        addedDate: DateTime.now().subtract(const Duration(days: 30)),
        expirationDate: DateTime.now().add(const Duration(days: 335)),
        notes: 'Works well for me',
        effectivenessRating: 4,
      ),
      MedicineCabinetItem(
        id: 'item-002',
        plantId: 'plant-004',
        plantName: 'Ginger',
        form: 'Tea',
        brand: 'Traditional Medicinals',
        dosage: '1 cup',
        frequency: 'As needed',
        purpose: 'Digestion',
        addedDate: DateTime.now().subtract(const Duration(days: 15)),
        notes: 'Great for upset stomach',
        effectivenessRating: 5,
      ),
      MedicineCabinetItem(
        id: 'item-003',
        plantId: 'plant-001',
        plantName: 'Echinacea',
        form: 'Capsule',
        brand: 'Gaia Herbs',
        dosage: '500mg',
        frequency: '3 times daily',
        purpose: 'At first sign of cold',
        addedDate: DateTime.now().subtract(const Duration(days: 60)),
        expirationDate: DateTime.now().add(const Duration(days: 20)),
        notes: 'Take at first sign of symptoms',
        effectivenessRating: 3,
      ),
    ];

    _items.addAll(sampleItems);
    notifyListeners();
  }
}
