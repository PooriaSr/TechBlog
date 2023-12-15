import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tech_blog/constant/dims.dart';
import 'package:tech_blog/constant/my_components.dart';

class ArticleContentEditor extends StatefulWidget {
  const ArticleContentEditor({super.key});

  @override
  State<ArticleContentEditor> createState() => _ArticleContentEditorState();
}

class _ArticleContentEditorState extends State<ArticleContentEditor> {
  final QuillController _quillController = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("ویرایش مقاله"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: Dims.halfBodyMargin, right: Dims.halfBodyMargin),
            child: Column(
              children: [
                Card(
                    child: QuillEditor(
                  scrollController: _scrollController,
                  focusNode: _focusNode,
                  configurations: QuillEditorConfigurations(
                    controller: _quillController,
                    placeholder: 'yuguyuyguuygyug',
                    minHeight: Get.height / 3.5,
                    maxHeight: Get.height / 2.5,
                    onTapOutside: (event, focusNode) => _focusNode.unfocus(),
                    padding: EdgeInsets.all(Dims.halfBodyMargin),
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
                QuillToolbar.simple(
                    configurations: QuillSimpleToolbarConfigurations(
                        buttonOptions: const QuillToolbarButtonOptions(
                            fontSize: QuillToolbarFontSizeButtonOptions(
                                iconSize: 19)),
                        toolbarSize: Get.height / 15,
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
                        controller: _quillController)),
                Container(
                  height: Get.height / 4,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
