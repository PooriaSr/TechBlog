import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:tech_blog/constant/dims.dart';

class ArticleContentEditor extends StatefulWidget {
  const ArticleContentEditor({super.key});

  @override
  State<ArticleContentEditor> createState() => _ArticleContentEditorState();
}

class _ArticleContentEditorState extends State<ArticleContentEditor> {
  final QuillController _quillController = QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dims.halfBodyMargin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                QuillProvider(
                    configurations:
                        QuillConfigurations(controller: _quillController),
                    child: QuillToolbar(
                      configurations: QuillToolbarConfigurations(
                        showAlignmentButtons: true,
                        showClearFormat: false,
                        showLink: false,
                        showInlineCode: false,
                        showCodeBlock: false,
                        showSubscript: false,
                        showSuperscript: false,
                        showHeaderStyle: false,
                        showListCheck: false,
                        showSearchButton: false,
                        showFontFamily: false,
                        fontSizesValues: Dims.articlefontSize,
                      ),
                    )),
                QuillProvider(
                    configurations: QuillConfigurations(
                      controller: _quillController,
                    ),
                    child: QuillEditor.basic(
                      scrollController: ScrollController(),
                      focusNode: _focusNode,
                      configurations: QuillEditorConfigurations(
                        onTapOutside: (event, focusNode) =>
                            _focusNode.unfocus(),
                        padding: EdgeInsets.all(Dims.halfBodyMargin),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
