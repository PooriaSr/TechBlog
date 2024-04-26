import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/manage_article_controller.dart';
import 'package:tech_blog/controller/single_article_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/route_manager/named_route.dart';

class ManageArticleScreen extends StatelessWidget {
  ManageArticleScreen({super.key});
  final manageArticleController = Get.find<ManageArticleController>();
  final singleArticleScreenController =
      Get.find<SingleArticleScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(MyStrings.manageArticles),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            children: [
              Obx(
                () => SizedBox(
                    height: Get.height / 1.4,
                    child: manageArticleController.loading.value == true
                        ? const SpinKitLoading()
                        : manageArticleController.userArticleList.isEmpty
                            ? emptyState()
                            : publishedState()),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
            style: ButtonStyle(
                fixedSize:
                    MaterialStateProperty.all(Size(Get.width / 1.2, 60))),
            onPressed: () {
              Get.toNamed(NamedRoute.writeArticleScreen);
            },
            child: Text(
              MyStrings.letsGoWriteAnArticle,
              style: MyTextStyle.manageArticleScreenBtn,
            )),
      ),
    );
  }

  SizedBox publishedState() {
    return SizedBox(
      child: ListView.builder(
        itemCount: manageArticleController.userArticleList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(children: [
            GestureDetector(
              onTap: () {
                singleArticleScreenController.getSingleArticle(
                    manageArticleController.userArticleList[index].id!);
                Get.toNamed(NamedRoute.singleArticleScreen);
              },
              child: CachedNetworkImage(
                imageUrl: manageArticleController.userArticleList[index].image!,
                imageBuilder: (context, imageProvider) => Container(
                  width: Get.width / 4,
                  height: Get.height / 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                placeholder: (context, url) => const SpinKitLoading(),
                errorWidget: (context, url, error) => ErrorImage(
                  height: Get.height / 10,
                  width: Get.width / 4,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: Get.width / 1.5,
              child: Column(
                children: [
                  Text(
                    manageArticleController.userArticleList[index].title!,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(manageArticleController
                          .userArticleList[index].author!),
                      Text(manageArticleController
                          .userArticleList[index].createdAt!),
                      Text(manageArticleController
                          .userArticleList[index].status!)
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Column emptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.images.emptyState.path,
          height: Get.height / 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(MyStrings.manageArticleScreenText,
              style: MyTextStyle.articleTitles, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
