class CategoriesModel {
  String? id;
  String? title;

  CategoriesModel({
    required this.id,
    required this.title,
  });

  CategoriesModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
  }
}
