import 'package:json_annotation/json_annotation.dart';

part 'plant.g.dart';

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

/// Contraindication severity levels
enum Severity {
  @JsonValue('mild')
  mild,
  @JsonValue('moderate')
  moderate,
  @JsonValue('severe')
  severe,
  @JsonValue('contraindicated')
  contraindicated,
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

/// Phytochemical compound information
@JsonSerializable()
class Phytochemical {
  final String name;
  final String? chemicalClass;
  final String? pubchemId;
  final String? casNumber;
  final String? proposedMechanism;
  final String? concentration;

  Phytochemical({
    required this.name,
    this.chemicalClass,
    this.pubchemId,
    this.casNumber,
    this.proposedMechanism,
    this.concentration,
  });

  factory Phytochemical.fromJson(Map<String, dynamic> json) =>
      _$PhytochemicalFromJson(json);
  Map<String, dynamic> toJson() => _$PhytochemicalToJson(this);
}

/// Preparation method for herbal remedy
@JsonSerializable()
class PreparationMethod {
  final String method;
  final String instructions;
  final String? dosage;
  final String? frequency;
  final String? duration;
  final String? notes;

  PreparationMethod({
    required this.method,
    required this.instructions,
    this.dosage,
    this.frequency,
    this.duration,
    this.notes,
  });

  factory PreparationMethod.fromJson(Map<String, dynamic> json) =>
      _$PreparationMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PreparationMethodToJson(this);
}

/// Contraindication information
@JsonSerializable()
class Contraindication {
  final String category;
  final Severity severity;
  final String description;
  final List<Reference>? references;

  Contraindication({
    required this.category,
    required this.severity,
    required this.description,
    this.references,
  });

  factory Contraindication.fromJson(Map<String, dynamic> json) =>
      _$ContraindicationFromJson(json);
  Map<String, dynamic> toJson() => _$ContraindicationToJson(this);

  /// Get human-readable severity
  String get severityDisplay {
    switch (severity) {
      case Severity.mild:
        return 'Mild';
      case Severity.moderate:
        return 'Moderate';
      case Severity.severe:
        return 'Severe';
      case Severity.contraindicated:
        return 'Contraindicated';
    }
  }
}

/// Plant image information
@JsonSerializable()
class PlantImage {
  final String url;
  final String altText;
  final String? caption;
  final String imageType;
  final String? thumbnailUrl;
  final String? attribution;
  final String? license;

  PlantImage({
    required this.url,
    required this.altText,
    this.caption,
    required this.imageType,
    this.thumbnailUrl,
    this.attribution,
    this.license,
  });

  factory PlantImage.fromJson(Map<String, dynamic> json) =>
      _$PlantImageFromJson(json);
  Map<String, dynamic> toJson() => _$PlantImageToJson(this);
}

/// Harvesting guidance information
@JsonSerializable()
class HarvestingGuidance {
  final List<String> partUsed;
  final String? harvestSeason;
  final String? sustainabilityNotes;
  final String? cultivationDifficulty;

  HarvestingGuidance({
    required this.partUsed,
    this.harvestSeason,
    this.sustainabilityNotes,
    this.cultivationDifficulty,
  });

  factory HarvestingGuidance.fromJson(Map<String, dynamic> json) =>
      _$HarvestingGuidanceFromJson(json);
  Map<String, dynamic> toJson() => _$HarvestingGuidanceToJson(this);
}

/// Medicinal plant information
@JsonSerializable()
class Plant {
  final String id;
  final String scientificName;
  final List<String> commonNames;
  final String? family;
  final String? genus;
  final String? species;
  final String description;
  final List<PlantImage>? images;
  final List<Phytochemical>? phytochemicals;
  final List<PreparationMethod>? preparationMethods;
  final List<Contraindication>? contraindications;
  final HarvestingGuidance? harvestingGuidance;
  final EvidenceLevel evidenceLevel;
  final List<Reference> references;
  final DateTime? lastReviewedDate;
  final List<String>? reviewedBy;

  Plant({
    required this.id,
    required this.scientificName,
    required this.commonNames,
    this.family,
    this.genus,
    this.species,
    required this.description,
    this.images,
    this.phytochemicals,
    this.preparationMethods,
    this.contraindications,
    this.harvestingGuidance,
    required this.evidenceLevel,
    required this.references,
    this.lastReviewedDate,
    this.reviewedBy,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
  Map<String, dynamic> toJson() => _$PlantToJson(this);

  /// Get primary common name
  String get primaryCommonName => commonNames.isNotEmpty ? commonNames.first : scientificName;

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

  /// Check if plant has severe contraindications
  bool get hasSevereContraindications {
    if (contraindications == null) return false;
    return contraindications!.any(
      (c) => c.severity == Severity.severe || c.severity == Severity.contraindicated,
    );
  }

  /// Search helper - combines searchable text
  String get searchableText {
    return [
      scientificName,
      ...commonNames,
      family ?? '',
      description,
    ].join(' ').toLowerCase();
  }
}
