import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/commands.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/storage_constant.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:dio/dio.dart' as dio;
import '../constant/my_strings.dart';
import '../models/article_info_model.dart';

class NewArticleController extends GetxController {
  Rx<ArticleInfoModel> newArticle = ArticleInfoModel().obs;
  TextEditingController titleTextEditingController = TextEditingController();
  final Rx<QuillController> _quillController = QuillController.basic().obs;
  Rx<Document> document = Document().obs;
  RxList<TagsModel> tagList = RxList();
  Rx<PlatformFile> file = PlatformFile(name: 'nothing', size: 0).obs;

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
    var response = await DioService().getMethod(ApiUrlConstant.getTagsList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });
    }
  }

  selectionTag(int index) {
    newArticle.update((val) {
      val!.catId = tagList[index].id;
      val.catName = tagList[index].title;
      Get.back();
    });
    Get.closeAllSnackbars();
    Get.rawSnackbar(
        message: 'انتخاب دسته بندی انجام گردید',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: SolidColors.primaryColor,
        snackStyle: SnackStyle.GROUNDED);
  }

  clearTagSelected() {
    newArticle.update((val) {
      val!.catName = null;
    });
  }

  storeArticle() async {
    Map<String, dynamic> map = {
      ApiKeyConstant.title: newArticle.value.title,
      ApiKeyConstant.content: newArticle.value.content,
      ApiKeyConstant.catId: newArticle.value.catId,
      ApiKeyConstant.tagList: '[]',
      ApiKeyConstant.userId: GetStorage().read(StorageConstant.userId),
      ApiKeyConstant.image: await dio.MultipartFile.fromFile(file.value.path!),
      ApiKeyConstant.command: Commands.store
    };

    // debugPrint(newArticle.value.title);
    // debugPrint(newArticle.value.content);
    // debugPrint(newArticle.value.catId);
    // debugPrint(GetStorage().read(StorageConstant.userId));
    // debugPrint(GetStorage().read(StorageConstant.token));
    // debugPrint(file.value.path!);
    // debugPrint(Commands.store);

    var response =
        await DioService().postMethod(map, ApiUrlConstant.postArticleUrl);
    debugPrint(response.data.toString());
  }
}
