import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class SingleArticleScreenController extends GetxController {
  Rx<ArticleInfoModel> articleInfo = ArticleInfoModel().obs;
  // RxInt id = RxInt(-1);
  RxBool loading = false.obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  // @override
  // onInit() {
  //   super.onInit();
  //   getSingleArticle();
  // }

  getSingleArticle(String id) async {
    loading.value = true;
    var userId = '';
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (true) {
      articleInfo.value = ArticleInfoModel.fromJson(response.data);
      if (tagsList.isNotEmpty) {
        tagsList.clear();
      }
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });
      if (relatedList.isNotEmpty) {
        relatedList.clear();
      }
      response.data['related'].forEach((element) {
        relatedList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
