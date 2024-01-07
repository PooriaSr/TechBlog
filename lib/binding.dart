import 'package:get/get.dart';
import 'package:tech_blog/controller/file_controller.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/list_article_screen_controller.dart';
import 'package:tech_blog/controller/manage_article_controller.dart';
import 'package:tech_blog/controller/my_cats_controller.dart';
import 'package:tech_blog/controller/new_article_controller.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/controller/single_article_screen_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleListScreenController());
    Get.lazyPut(() => SingleArticleScreenController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class CatsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyCatsController());
  }
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(ArticleListScreenController());
    Get.lazyPut(() => SingleArticleScreenController());
  }
}

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageArticleController());
    Get.lazyPut(() => FilePickerController());
    Get.lazyPut(() => NewArticleController());
  }
}
