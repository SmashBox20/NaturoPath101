import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MedicineCabinetService {
  // Local-only, encrypted storage for user's medications (default).
  final _storage = const FlutterSecureStorage();

  // Key for medication list (encrypted)
  static const _medKey = 'naturo_med_list_v1';

  Future<void> saveMedicationList(String jsonList) async {
    await _storage.write(key: _medKey, value: jsonList);
  }

  Future<String?> loadMedicationList() async {
    return await _storage.read(key: _medKey);
  }

  Future<void> clearMedicationList() async {
    await _storage.delete(key: _medKey);
  }

  // Interaction check stub: in the app this would call a local rule engine,
  // or (with explicit consent) a backend interaction API.
  Future<List<Map<String, dynamic>>> checkInteractions({
    required List<String> medicationActiveIngredients,
    required List<String> herbPhytochemicals,
  }) async {
    // TODO: implement rule-based checks (CYP interactions, additive PD, allergy signals)
    // For the starter, return an empty list (no interactions detected).
    return [];
  }
}
