import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class MyCatsController extends GetxController {
  RxList<TagsModel> tagsList = RxList();
  RxList<TagsModel> selectedTagsList = RxList();

  @override
  onInit() {
    super.onInit();
    getTagsMethod();
  }

  getTagsMethod() async {
    var response = await DioService().getMethod(ApiConstant.getTagsList);
    response.data.forEach((element) {
      tagsList.add(TagsModel.fromJson(element));
    });
  }
}
