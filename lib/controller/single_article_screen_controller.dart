import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class SingleArticleScreenController extends GetxController {
  Rx<ArticleInfoModel> articleInfo = ArticleInfoModel().obs;
  RxInt id = RxInt(-1);
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSingleArticle();
  }

  getSingleArticle() async {
    loading.value = true;
    var userId = 1;
    var response = await DioService().getMethod(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      articleInfo.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
  }
}
