import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

/// Evidence level for scientific validation
enum EvidenceLevel {
  @JsonValue('traditional')
  traditional,
  @JsonValue('in_vitro')
  inVitro,
  @JsonValue('animal')
  animal,
  @JsonValue('human_trial')
  humanTrial,
  @JsonValue('strong_clinical')
  strongClinical,
}

/// Reference to scientific literature
@JsonSerializable()
class Reference {
  final String type;
  final String? id;
  final String title;
  final String? authors;
  final int? year;
  final String? url;

  Reference({
    required this.type,
    this.id,
    required this.title,
    this.authors,
    this.year,
    this.url,
  });

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);
  Map<String, dynamic> toJson() => _$ReferenceToJson(this);
}

/// Plant recommendation for a condition
@JsonSerializable()
class RecommendedPlant {
  final String plantId;
  final String usage;
  final EvidenceLevel? evidenceLevel;

  RecommendedPlant({
    required this.plantId,
    required this.usage,
    this.evidenceLevel,
  });

  factory RecommendedPlant.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPlantFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendedPlantToJson(this);
}

/// Health condition with herbal remedy recommendations
@JsonSerializable()
class Condition {
  final String id;
  final String name;
  final List<String> synonyms;
  final List<String> icdCodes;
  final String overview;
  final List<String> symptoms;
  final List<String> redFlags;
  final List<RecommendedPlant> recommendedPlants;
  final EvidenceLevel evidenceLevel;
  final List<Reference> references;
  final DateTime? lastReviewedDate;
  final List<String>? reviewedBy;

  Condition({
    required this.id,
    required this.name,
    required this.synonyms,
    required this.icdCodes,
    required this.overview,
    required this.symptoms,
    required this.redFlags,
    required this.recommendedPlants,
    required this.evidenceLevel,
    required this.references,
    this.lastReviewedDate,
    this.reviewedBy,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  /// Get human-readable evidence level
  String get evidenceLevelDisplay {
    switch (evidenceLevel) {
      case EvidenceLevel.strongClinical:
        return 'Strong Clinical Evidence';
      case EvidenceLevel.humanTrial:
        return 'Human Trial Evidence';
      case EvidenceLevel.animal:
        return 'Animal Study Evidence';
      case EvidenceLevel.inVitro:
        return 'In Vitro Evidence';
      case EvidenceLevel.traditional:
        return 'Traditional Use';
    }
  }

  /// Get star rating for evidence level (1-5)
  int get evidenceStars {
    switch (evidenceLevel) {
      case EvidenceLevel.strongClinical:
        return 5;
      case EvidenceLevel.humanTrial:
        return 4;
      case EvidenceLevel.animal:
        return 3;
      case EvidenceLevel.inVitro:
        return 2;
      case EvidenceLevel.traditional:
        return 1;
    }
  }

  /// Search helper - combines searchable text
  String get searchableText {
    return [
      name,
      ...synonyms,
      ...icdCodes,
      overview,
      ...symptoms,
    ].join(' ').toLowerCase();
  }
}
