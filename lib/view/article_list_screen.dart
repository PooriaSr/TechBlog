import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/list_article_screen_controller.dart';
import 'package:tech_blog/view/single_article_screen.dart';
import '../constant/my_components.dart';
import '../controller/single_article_screen_controller.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    ArticleListScreenController articleListScreenController =
        Get.put(ArticleListScreenController());
    SingleArticleScreenController singleArticleScreenController =
        Get.put(SingleArticleScreenController());
    return Scaffold(
      backgroundColor: SolidColors.backGround,
      appBar: appBar(MyStrings.articleList, phoneSize),
      body: SafeArea(
        child: Obx(
          () => SizedBox(
            child: ListView.builder(
              itemCount: articleListScreenController.articleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleScreenController.getSingleArticle(int.parse(
                        articleListScreenController.articleList[index].id!));
                    Get.to(() => const SingleArticleScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 3.7,
                          height: Get.height / 8,
                          child: CachedNetworkImage(
                            imageUrl: articleListScreenController
                                .articleList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              width: Get.width / 3,
                              height: Get.height / 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                            placeholder: (context, url) =>
                                const SpinKitLoading(),
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
                                  articleListScreenController
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
                                    articleListScreenController
                                        .articleList[index].author!,
                                    style: MyTextStyle.articlesCaptions,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "${articleListScreenController.articleList[index].view!}  بازدید",
                                    style: MyTextStyle.articlesCaptions,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
