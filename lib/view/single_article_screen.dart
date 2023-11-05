import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/single_article_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class SingleArticleScreen extends StatelessWidget {
  const SingleArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SingleArticleScreenController singleArticleScreenController =
        Get.put(SingleArticleScreenController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => SafeArea(
            child: singleArticleScreenController.loading.value == false
                ? Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: Get.width,
                            height: Get.height / 3.5,
                            child: CachedNetworkImage(
                              imageUrl: singleArticleScreenController
                                  .articleInfo.value.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                              errorWidget: (context, url, error) =>
                                  const ErrorImage(),
                              placeholder: (context, url) =>
                                  const SpinKitLoading(),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: Get.height / 9,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: GradientColors.singleAppbarGradiant,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 24, left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.bookmark_outline,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          singleArticleScreenController
                              .articleInfo.value.title!,
                          style: MyTextStyle.articleTitles,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image(
                            image: Assets.images.profileAvatar.provider(),
                            height: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(singleArticleScreenController
                              .articleInfo.value.author!),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            singleArticleScreenController
                                .articleInfo.value.createdAt!,
                            style: MyTextStyle.articlesCaptions,
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 16, left: 36, top: 8),
                        child: HtmlWidget(
                          singleArticleScreenController
                              .articleInfo.value.content!,
                          textStyle: MyTextStyle.articleText,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              singleArticleScreenController.tagsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: SolidColors.tags,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, left: 16),
                                    child: Text(
                                      singleArticleScreenController
                                          .tagsList[index].title!,
                                      style: MyTextStyle.articleText,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 2.5),
                    child: const SpinKitLoading(),
                  ),
          ),
        ),
      ),
    );
  }
}
