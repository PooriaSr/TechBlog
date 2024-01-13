import 'package:tech_blog/constant/commands.dart';

class ApiUrlConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getTagsList = "${baseUrl}article/get.php?command=tags";
  static const getNewArticle =
      "${baseUrl}article/get.php?command=new&user_id=1";
  static const postRegisterUrl = "${baseUrl}register/action.php";
  static const postArticleUrl = "${baseUrl}article/post.php";

  static const publishedByMe =
      "${baseUrl}article/get.php?command=published_by_me&user_id=";
}

class ApiKeyConstant {
  static const String title = 'title';
  static const String content = 'content';
  static const String catId = 'cat_id';
  static const String tagList = 'tag_list';
  static const String userId = 'user_id';
  static const String image = 'image';
  static const String command = 'command';
}
