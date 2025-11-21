class MedicinalPlant {
  final String id;
  final String commonName;
  final List<String> alternateNames;
  final String scientificName;
  final String family;
  final List<String> nativeRegions;
  final String description;
  final List<String> partsUsed;
  final List<String> traditionalUses;
  final List<String> modernUses;
  final String safetyRating;
  final List<String> contraindications;
  final List<String> sideEffects;
  final String pregnancy;
  final String breastfeeding;
  final List<String> conditionsAddressed;

  MedicinalPlant({
    required this.id,
    required this.commonName,
    required this.alternateNames,
    required this.scientificName,
    required this.family,
    required this.nativeRegions,
    required this.description,
    required this.partsUsed,
    required this.traditionalUses,
    required this.modernUses,
    required this.safetyRating,
    required this.contraindications,
    required this.sideEffects,
    required this.pregnancy,
    required this.breastfeeding,
    required this.conditionsAddressed,
  });

  factory MedicinalPlant.fromJson(Map<String, dynamic> json) {
    return MedicinalPlant(
      id: json['id'] as String,
      commonName: json['commonName'] as String,
      alternateNames: (json['alternateNames'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      scientificName: json['scientificName'] as String,
      family: json['family'] as String,
      nativeRegions: (json['nativeRegions'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      description: json['description'] as String,
      partsUsed: (json['partsUsed'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      traditionalUses: (json['traditionalUses'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      modernUses: (json['modernUses'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      safetyRating: json['safetyRating'] as String,
      contraindications: (json['contraindications'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      sideEffects: (json['sideEffects'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      pregnancy: json['pregnancy'] as String? ?? 'Unknown',
      breastfeeding: json['breastfeeding'] as String? ?? 'Unknown',
      conditionsAddressed: (json['conditionsAddressed'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'commonName': commonName,
      'alternateNames': alternateNames,
      'scientificName': scientificName,
      'family': family,
      'nativeRegions': nativeRegions,
      'description': description,
      'partsUsed': partsUsed,
      'traditionalUses': traditionalUses,
      'modernUses': modernUses,
      'safetyRating': safetyRating,
      'contraindications': contraindications,
      'sideEffects': sideEffects,
      'pregnancy': pregnancy,
      'breastfeeding': breastfeeding,
      'conditionsAddressed': conditionsAddressed,
    };
  }

  String get safetyIcon {
    switch (safetyRating.toLowerCase()) {
      case 'generally safe':
        return '✅';
      case 'use with caution':
        return '⚠️';
      case 'requires medical supervision':
        return '🔴';
      case 'not recommended':
        return '❌';
      default:
        return '❓';
    }
  }

  String get displayName => commonName;

  String get fullScientificName => scientificName;
}
