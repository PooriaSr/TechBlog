import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleListScreenController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getArticleListItems();
  }

  getArticleListItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getNewArticle);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
        loading.value = false;
      });
    }
  }
}
