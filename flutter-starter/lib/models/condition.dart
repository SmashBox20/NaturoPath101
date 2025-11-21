class Condition {
  final String id;
  final String name;
  final List<String> synonyms;
  final String overview;
  final List<String> symptoms;
  final String redFlags;
  final List<String> recommendedPlantIds;
  final String evidenceLevel;

  Condition({
    required this.id,
    required this.name,
    this.synonyms = const [],
    this.overview = '',
    this.symptoms = const [],
    this.redFlags = '',
    this.recommendedPlantIds = const [],
    this.evidenceLevel = 'traditional',
  });
}
