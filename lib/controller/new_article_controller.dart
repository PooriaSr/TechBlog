import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../constant/my_strings.dart';
import '../models/article_info_model.dart';

class NewArticleController extends GetxController {
  Rx<ArticleInfoModel> newArticle = ArticleInfoModel().obs;
  TextEditingController titleTextEditingController = TextEditingController();
  final Rx<QuillController> _quillController = QuillController.basic().obs;
  Rx<Document> document = Document().obs;

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
}
