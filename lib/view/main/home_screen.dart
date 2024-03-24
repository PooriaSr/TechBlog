import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/list_article_screen_controller.dart';
import 'package:tech_blog/controller/single_article_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/constant/my_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.phoneSize,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size phoneSize;
  final TextTheme textTheme;
  final double bodyMargin;
  final homeScreenController = Get.find<HomeScreenController>();
  final articleListScreenController = Get.find<ArticleListScreenController>();
  final singleArticleScreenController =
      Get.find<SingleArticleScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => homeScreenController.loading.value == false
            ? Column(
                children: [
                  homePagePoster(),
                  const SizedBox(
                    height: 40,
                    width: double.infinity,
                  ),
                  homePageTags(),
                  const SizedBox(
                    height: 40,
                    width: double.infinity,
                  ),
                  homePageTopVisitedTitle(),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  homePageTopVisied(),
                  const SizedBox(
                    height: 35,
                    width: double.infinity,
                  ),
                  homePageTopPodcastTitle(),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  homePageTopPodcast(),
                  const SizedBox(
                    height: 60,
                    width: double.infinity,
                  ),
                ],
              )
            : SizedBox(height: Get.height / 1.5, child: const SpinKitLoading()),
      ),
    );
  }

  Widget homePageTopPodcast() {
    return Obx(
      () => SizedBox(
        height: phoneSize.height / 4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topPodcastList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 14),
                child: Column(
                  children: [
                    SizedBox(
                      height: phoneSize.height / 6,
                      width: phoneSize.width / 2.8,
                      child: CachedNetworkImage(
                          imageUrl: homeScreenController
                              .topPodcastList[index].poster!,
                          imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                          placeholder: (context, url) => const SpinKitLoading(),
                          errorWidget: (context, url, error) => ErrorImage(
                                height: phoneSize.height / 6,
                                width: phoneSize.width / 2.8,
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        homeScreenController.topPodcastList[index].title!,
                        style: textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget homePageTopVisied() {
    return Obx(
      () => SizedBox(
        height: phoneSize.height / 4.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticleScreenController.getSingleArticle(
                    homeScreenController.topVisitedList[index].id!);
                Get.toNamed(NamedRoute.singleArticleScreen);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 14),
                child: Column(
                  children: [
                    SizedBox(
                      width: phoneSize.width / 2.4,
                      height: phoneSize.height / 5.8,
                      child: Stack(children: [
                        CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                                foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: const LinearGradient(
                                      colors: GradientColors.blogPost,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ))),
                            placeholder: (context, url) =>
                                const SpinKitLoading(),
                            errorWidget: (context, url, error) => ErrorImage(
                                  width: phoneSize.width / 2.4,
                                  height: phoneSize.height / 5.8,
                                )),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: textTheme.titleSmall,
                              ),
                              Row(
                                children: [
                                  Text(
                                      homeScreenController
                                          .topVisitedList[index].view!,
                                      style: textTheme.titleSmall),
                                  const SizedBox(width: 10),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Icon(
                                      CupertinoIcons.eye_fill,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: SizedBox(
                          width: phoneSize.width / 2.5,
                          child: Text(
                            homeScreenController.topVisitedList[index].title!,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyMedium,
                          )),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget homePageTopPodcastTitle() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphon.provider(),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            MyStrings.viewMostHitPodcasts,
            style: textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget homePagePoster() {
    return SizedBox(
      width: phoneSize.width / 1.19,
      height: phoneSize.height / 4.2,
      child: GestureDetector(
        onTap: () {
          singleArticleScreenController
              .getSingleArticle(homeScreenController.poster.value.id!);
          Get.toNamed(NamedRoute.singleArticleScreen);
        },
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            placeholder: (context, url) => const SpinKitLoading(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                      colors: GradientColors.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            errorWidget: (context, url, error) => ErrorImage(
              width: phoneSize.width / 1.19,
              height: phoneSize.height / 4.2,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: phoneSize.width / 1.23,
                  child: Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget homePageTopVisitedTitle() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: GestureDetector(
        onTap: () {
          articleListScreenController.getArticleListItems();
          articleListScreenController.appBarTitle.value = MyStrings.articleList;
          Get.toNamed(NamedRoute.articleScreen);
        },
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.bluePen.provider(),
              color: SolidColors.seeMore,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              MyStrings.viewMostHitPosts,
              style: textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }

  Widget homePageTags() {
    return SizedBox(
      height: Get.height / 22.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 14),
            child: GestureDetector(
              onTap: () {
                articleListScreenController.getArticleListWithTagId(
                    homeScreenController.tagsList[index].id!);
                Get.toNamed(NamedRoute.articleScreen);
              },
              child: Container(
                height: Get.height / 22.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                        colors: GradientColors.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 8, 0),
                  child: Row(
                    children: [
                      ImageIcon(
                        Assets.icons.hashtagicon.provider(),
                        size: 14,
                        color: SolidColors.tags,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        homeScreenController.tagsList[index].title!,
                        style: textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
