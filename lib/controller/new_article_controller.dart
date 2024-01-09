import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';

import '../constant/my_strings.dart';
import '../models/article_info_model.dart';

class NewArticleController extends GetxController {
  Rx<ArticleInfoModel> newArticle = ArticleInfoModel().obs;
  TextEditingController titleTextEditingController = TextEditingController();
  final Rx<QuillController> _quillController = QuillController.basic().obs;
  Rx<Document> document = Document().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<TagsModel> selectedTagList = RxList();

  @override
  onInit() {
    super.onInit();
    getTags();
  }

  updateTitle() {
    newArticle.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  updateContent() {
    document.update((val) {
      val = _quillController.value.document;
    });
    newArticle.value.content = document.value.toPlainText();
    Get.toNamed(NamedRoute.writeArticleScreen);
  }

  getTags() async {
    var response = await DioService().getMethod(ApiConstant.getTagsList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });
    }
  }

  selectionTags(int index) {
    if (selectedTagList.contains(tagList[index])) {
      Get.snackbar('', '${tagList[index].title} قبلا اضافه شده است.',
          backgroundColor: SolidColors.primaryColor.withAlpha(180),
          colorText: Colors.white);
    } else {
      selectedTagList.add(tagList[index]);
      Get.snackbar('', '${tagList[index].title} با موفقیت اضافه گردید.',
          backgroundColor: SolidColors.primaryColor.withAlpha(180),
          colorText: Colors.white);
    }
  }

  removeSelectionTags(int index) {
    selectedTagList.removeAt(index);
  }
}
