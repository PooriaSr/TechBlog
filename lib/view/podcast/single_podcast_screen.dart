import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/dims.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/podcast_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class SinglePodcastScreen extends StatelessWidget {
  //TODO add to binding
  final PodcastController podcastController = Get.put(PodcastController());
  //final podcastController = Get.find<PodcastController>();

  SinglePodcastScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //podcast poster
              SizedBox(
                height: Get.height / 3.5,
                width: Get.width,
                child: Stack(children: [
                  CachedNetworkImage(
                    //TODO: fix index bug
                    imageUrl: podcastController.podcastInfo.value.poster!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        ErrorImage(width: Get.width, height: Get.height / 3),
                    placeholder: (context, url) => const Placeholder(),
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
                      padding:
                          const EdgeInsets.only(bottom: 24, left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ]),
              ),
              const SizedBox(
                height: 16,
              ),

              Padding(
                padding: EdgeInsets.only(
                    right: Dims.halfBodyMargin, left: Dims.halfBodyMargin),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //podcast title & author
                      Text(
                        'پادکست :${podcastController.podcastInfo.value.title!}',
                        style: MyTextStyle.articleTitles,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Image(
                            image: Assets.images.profileAvatar.provider(),
                            height: 36,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            podcastController.podcastInfo.value.author!,
                            style: MyTextStyle.articlesCaptions,
                          ),
                        ],
                      ),

                      //podcast files
                      SizedBox(
                        height: Get.height / 3.5,
                        child: ListView.builder(
                          itemCount: podcastController.podcastFiles.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: () => debugPrint('Podcast played'),
                              child: Container(
                                color: Colors.transparent,
                                height: Get.height / 25,
                                width: Get.width,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 15,
                                      child: Image(
                                        image:
                                            Assets.icons.microphon.provider(),
                                        height: 28,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.6,
                                      child: Text(
                                        podcastController
                                            .podcastFiles[index].title!,
                                        style: MyTextStyle.bluePenTitles,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textScaler:
                                            const TextScaler.linear(0.9),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    //TODO: fix minutes section :00
                                    SizedBox(
                                      width: Get.width / 9,
                                      child: Text(
                                        "00 : ${podcastController.podcastFiles[index].length!}",
                                        style: MyTextStyle.bluePenTitles,
                                        textScaler:
                                            const TextScaler.linear(0.9),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height / 8,
                        color: Colors.amber,
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
