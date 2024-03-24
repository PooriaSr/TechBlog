import 'package:tech_blog/constant/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  PodcastModel();

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    poster = ApiUrlConstant.hostDlUrl + element['poster'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }

  PodcastModel.fromJson2(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    poster = ApiUrlConstant.hostDlUrl + element['poster'];
    // catName = element['cat_name'];
    author = element['publisher'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
    isFavorite = element['isFavorite'];
  }
}
