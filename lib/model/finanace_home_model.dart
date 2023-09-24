class FinanceHomeModel {
  String? id;
  String? imgUrl;
  String? rating;
  int? totalRating;
  bool? saved;
  String? category;
  String? name;
  String? description;
  String? about;
  List<String>? languageKnown;
  List<String>? location;
  List<String>? knownCategoryTypes;
  FinanceHomeModel({
    required this.id,
    required this.imgUrl,
    required this.rating,
    required this.totalRating,
    required this.saved,
    required this.category,
    required this.name,
    required this.description,
    required this.about,
    required this.languageKnown,
    required this.location,
    required this.knownCategoryTypes,
  });
}