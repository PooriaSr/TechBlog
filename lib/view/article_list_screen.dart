import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/article_screen_controller.dart';
import '../constant/my_components.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    ArticleScreenController articleScreenController =
        Get.put(ArticleScreenController());
    return Scaffold(
      backgroundColor: SolidColors.backGround,
      appBar: appBar(MyStrings.articleList, phoneSize),
      body: SafeArea(
        child: Obx(
          () => SizedBox(
            child: ListView.builder(
              itemCount: articleScreenController.articleList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 3.7,
                        height: Get.height / 8,
                        child: CachedNetworkImage(
                          imageUrl:
                              articleScreenController.articleList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            width: Get.width / 3,
                            height: Get.height / 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                          placeholder: (context, url) => const SpinKitLoading(),
                          errorWidget: (context, url, error) =>
                              const ErrorImage(),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 25,
                      ),
                      SizedBox(
                        width: Get.width / 1.6,
                        height: Get.height / 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                articleScreenController
                                    .articleList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: MyTextStyle.articleListTitles,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  articleScreenController
                                      .articleList[index].author!,
                                  style: MyTextStyle.articlesCaptions,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "${articleScreenController.articleList[index].view!}  بازدید",
                                  style: MyTextStyle.articlesCaptions,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
