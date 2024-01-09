import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/dims.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/file_controller.dart';
import 'package:tech_blog/controller/new_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/my_file_picker.dart';

class WriteArticleScreen extends StatelessWidget {
  WriteArticleScreen({super.key});

  final newArticleController = Get.find<NewArticleController>();
  final filePickerController = Get.find<FilePickerController>();
  late final Rx<QuillController> _quillController = QuillController(
          document: newArticleController.document.value,
          selection: const TextSelection.collapsed(offset: 0))
      .obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height / 3,
                    child: filePickerController.file.value.size == 0
                        ? Image(
                            image: Assets.images.singlePlaceHolder.provider(),
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(filePickerController.file.value.path!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height / 20,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradientColors.singleAppbarGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    right: Get.width / 3,
                    left: Get.width / 3,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        MyFilePicker().pickFile();
                      },
                      child: Container(
                        width: Get.width / 3,
                        height: Get.height / 20,
                        decoration: const BoxDecoration(
                            color: SolidColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MyStrings.chooseImage,
                              style: MyTextStyle.bottun,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: Dims.halfBodyMargin, left: Dims.halfBodyMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    //getTitle
                    GestureDetector(
                      onTap: () {
                        getTitle();
                      },
                      child: const BluePenIconTextTitleTechBlog(
                        title: MyStrings.bluePenWriteNewArticleTitle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //title
                    newArticleController.newArticle.value.title == null
                        ? const Text(MyStrings.defaultArticleTitle)
                        : Text(newArticleController.newArticle.value.title!),
                    const SizedBox(
                      height: 30,
                    ),
                    //getContent
                    GestureDetector(
                      onTap: () => Get.toNamed(NamedRoute.articleContentEditor),
                      child: const BluePenIconTextTitleTechBlog(
                        title: MyStrings.bluePenWriteNewArticleBody,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //content
                    newArticleController.newArticle.value.content == null
                        ? const Text(
                            MyStrings.defaultArticleContent,
                            textAlign: TextAlign.justify,
                          )
                        : QuillEditor.basic(
                            configurations: QuillEditorConfigurations(
                              readOnly: true,
                              showCursor: false,
                              controller: _quillController.value,
                            ),
                          ),

                    const SizedBox(
                      height: 30,
                    ),
                    //tagsSelection
                    GestureDetector(
                      onTap: () => selectTags(),
                      child: const BluePenIconTextTitleTechBlog(
                          title: MyStrings.bluePenWriteNewArticleTags),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //selectedTags
                    SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount:
                              newArticleController.selectedTagList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: SolidColors.tags),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, left: 8),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => newArticleController
                                          .removeSelectionTags(index),
                                      child: const Icon(
                                        Icons.delete,
                                        color: SolidColors.greyColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(newArticleController
                                        .selectedTagList[index].title!),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTitle() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.only(left: 15, right: 15),
        titlePadding: const EdgeInsets.only(top: 20, bottom: 20),
        radius: 15,
        title: MyStrings.dialogGetTitle,
        content: TextField(
          controller: newArticleController.titleTextEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        confirm: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              newArticleController.updateTitle();
              Get.back();
            },
            child: Text(MyStrings.confirm, style: MyTextStyle.bottun),
          ),
        ));
  }

  selectTags() {
    Get.bottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        SizedBox(
            height: Get.height / 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: SizedBox(
                child: GridView.builder(
                  itemCount: newArticleController.tagList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => newArticleController.selectionTags(index),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: const LinearGradient(
                                colors: GradientColors.tags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              Assets.icons.hashtagicon.path,
                              height: 12,
                              color: SolidColors.tags,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              newArticleController.tagList[index].title!,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            )));
  }
}
