import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/storage_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> userArticleList = RxList();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getManagedArticles();
  }

  getManagedArticles() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiUrlConstant.publishedByMe +
        GetStorage().read(StorageConstant.userId));
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        userArticleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
