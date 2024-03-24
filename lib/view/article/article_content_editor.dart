import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tech_blog/constant/dims.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/new_article_controller.dart';

class ArticleContentEditor extends StatefulWidget {
  const ArticleContentEditor({super.key});

  @override
  State<ArticleContentEditor> createState() => _ArticleContentEditorState();
}

class _ArticleContentEditorState extends State<ArticleContentEditor> {
  final _newArticleController = Get.find<NewArticleController>();
  late final Rx<QuillController> _quillController = QuillController(
          document: _newArticleController.document.value,
          selection: const TextSelection.collapsed(offset: 0))
      .obs;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: F,
      appBar:
          _focusNode.hasFocus ? editingArticleAppBar() : appBar('ویرایش مقاله'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: Get.height / 20, right: 15, left: 15),
        child: SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //TODO preview article screen
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black87)),
                onPressed: () {},
                child: Text(
                  MyStrings.preview,
                  style: MyTextStyle.bottun,
                )),
            ElevatedButton(
                onPressed: () {
                  String articleContent =
                      _quillController.value.document.toPlainText();
                  if (articleContent.removeAllWhitespace.length > 15) {
                    _newArticleController.updateContent();
                  } else {
                    errorDialog('خطا',
                        const Text('تعداد کاراکتر مقاله کمتر از حد مجاز است'));
                  }
                },
                child: Text(
                  MyStrings.confirm,
                  style: MyTextStyle.bottun,
                )),
          ],
        )),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: Dims.halfBodyMargin,
            right: Dims.halfBodyMargin,
          ),
          child: Obx(
            () => Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                QuillToolbar.simple(
                    configurations: QuillSimpleToolbarConfigurations(
                        buttonOptions: const QuillSimpleToolbarButtonOptions(
                            fontSize: QuillToolbarFontSizeButtonOptions(
                                iconSize: 19)),
                        toolbarSize: Get.height / 13,
                        showFontSize: T,
                        multiRowsDisplay: F,
                        showAlignmentButtons: T,
                        showDirection: T,
                        showListBullets: F,
                        showListNumbers: F,
                        showClearFormat: F,
                        showLink: F,
                        showInlineCode: F,
                        showCodeBlock: F,
                        showSubscript: F,
                        showSuperscript: F,
                        showHeaderStyle: F,
                        showListCheck: F,
                        showSearchButton: F,
                        showFontFamily: F,
                        fontSizesValues: Dims.articlefontSize,
                        controller: _quillController.value)),
                SingleChildScrollView(
                  reverse: T,
                  child: SizedBox(
                    height: Get.height / 1.7 -
                        MediaQuery.of(context).viewInsets.bottom / 1.8,
                    child: Card(
                        child: QuillEditor(
                      scrollController: _scrollController,
                      focusNode: _focusNode,
                      configurations: QuillEditorConfigurations(
                        controller: _quillController.value,
                        placeholder: MyStrings.defaultArticleContent,

                        maxHeight: Get.height / 1.7,
                        //customStyleBuilder: (attribute) =>  MyTextStyle.quillPlaceholder,
                        //onTapOutside: (event, focusNode) => _focusNode.unfocus(),
                        padding: EdgeInsets.all(Dims.halfBodyMargin),
                      ),
                    )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom / 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar editingArticleAppBar() => AppBar(
        automaticallyImplyLeading: F,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: SolidColors.primaryColor.withAlpha(220),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              onPressed: () {
                clearAlertMsg();
              },
              child: Text(
                'پاک کردن صفحه',
                style: MyTextStyle.bottun,
              )),
          TextButton(
              onPressed: () {
                _focusNode.unfocus();
              },
              child: Text(
                'انجام شد',
                style: MyTextStyle.bottun,
              )),
        ]),
      );

  errorDialog(String title, Widget text) {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 12),
        contentPadding: const EdgeInsets.all(12),
        title: title,
        titleStyle: MyTextStyle.errorDialogTitle,
        content: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8), child: text),
        confirm: ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                    Size(Get.width / 5, Get.height / 22))),
            onPressed: () {
              Get.back();
            },
            child: Text(
              MyStrings.ok,
              style: MyTextStyle.bottun,
            )));
  }

  clearAlertMsg() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        titlePadding: const EdgeInsets.only(top: 20, bottom: 20),
        radius: 15,
        title: 'تمام مطالب رو میخوای پاک کنی ؟',
        content: const Text(
          'اگر مطمئنی روی دکمه تایید بزن',
        ),
        confirm: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    SolidColors.blackColor.withAlpha(120)),
                fixedSize: MaterialStatePropertyAll(
                    Size(Get.width / 4, Get.height / 20)),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(MyStrings.cancel, style: MyTextStyle.bottun),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      SolidColors.erorColor.withRed(170)),
                  fixedSize: MaterialStatePropertyAll(
                      Size(Get.width / 4, Get.height / 20))),
              onPressed: () {
                _quillController.value.clear();
                _quillController.value.document.history.clear();
                Get.back();
              },
              child: Text(MyStrings.confirm, style: MyTextStyle.bottun),
            ),
          ],
        ));
  }
}
