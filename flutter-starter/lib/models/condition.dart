class Condition {
  final String id;
  final String name;
  final String category;
  final String description;
  final List<String> symptoms;
  final String severity;
  final List<String> conventionalTreatments;
  final List<String> lifestyleModifications;
  final List<String> warnings;
  final String prevalence;
  final List<String> tags;

  Condition({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.symptoms,
    required this.severity,
    required this.conventionalTreatments,
    required this.lifestyleModifications,
    required this.warnings,
    required this.prevalence,
    required this.tags,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      symptoms: (json['symptoms'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      severity: json['severity'] as String,
      conventionalTreatments:
          (json['conventionalTreatments'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
      lifestyleModifications:
          (json['lifestyleModifications'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
      warnings: (json['warnings'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      prevalence: json['prevalence'] as String? ?? '',
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'symptoms': symptoms,
      'severity': severity,
      'conventionalTreatments': conventionalTreatments,
      'lifestyleModifications': lifestyleModifications,
      'warnings': warnings,
      'prevalence': prevalence,
      'tags': tags,
    };
  }

  String get severityIcon {
    switch (severity.toLowerCase()) {
      case 'mild':
        return '🟢';
      case 'moderate':
        return '🟡';
      case 'severe':
        return '🔴';
      default:
        return '⚪';
    }
  }

  String get categoryIcon {
    switch (category.toLowerCase()) {
      case 'digestive':
        return '🍽️';
      case 'respiratory':
        return '🫁';
      case 'musculoskeletal':
        return '🦴';
      case 'cardiovascular':
        return '❤️';
      case 'nervous system':
        return '🧠';
      case 'immune system':
        return '🛡️';
      case 'skin':
        return '🧴';
      case 'mental health':
        return '🧘';
      case 'metabolic':
        return '⚡';
      case 'reproductive':
        return '👶';
      case 'urinary':
        return '💧';
      case 'endocrine':
        return '🔬';
      default:
        return '📋';
    }
  }
}
