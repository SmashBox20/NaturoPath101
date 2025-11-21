class Plant {
  final String id;
  final String scientificName;
  final List<String> commonNames;
  final String family;
  final String description;

  Plant({
    required this.id,
    required this.scientificName,
    this.commonNames = const [],
    this.family = '',
    this.description = '',
  });
}
