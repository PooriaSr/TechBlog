import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tech_blog/constant/dims.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_decoration.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/podcast_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class SinglePodcastScreen extends StatelessWidget {
  //TODO add to binding
  final podcastController = Get.find<PodcastController>();
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
                        height: Get.height / 3,
                        width: Get.width,
                        child: podcastController.loading.value == true
                            ? const Center(
                                child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator()))
                            : ListView.builder(
                                itemCount:
                                    podcastController.podcastFiles.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors.transparent,
                                      height: Get.height / 25,
                                      width: Get.width,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width / 15,
                                            child: Image(
                                              image: Assets.icons.microphon
                                                  .provider(),
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
                      SizedBox(height: Get.width / 15),
                      //podcast player
                      Container(
                        width: Get.width,
                        height: Get.height / 8,
                        decoration: MyDecoration.mainGradient,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox.shrink(),
                            LinearPercentIndicator(
                              backgroundColor: Colors.white,
                              progressColor: Colors.orange,
                              barRadius: const Radius.circular(3),
                              percent: 0.0,
                              lineHeight: 6,
                              padding: EdgeInsets.only(
                                  left: Dims.halfBodyMargin,
                                  right: Dims.halfBodyMargin),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox.shrink(),
                                Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: Get.width / 10,
                                ),
                                GestureDetector(
                                  onTap: () => podcastController.playButton(),
                                  child: podcastController.playState.isTrue
                                      ? Icon(Icons.pause_circle_filled,
                                          color: Colors.white,
                                          size: Get.width / 8)
                                      : Icon(Icons.play_circle_fill,
                                          color: Colors.white,
                                          size: Get.width / 8),
                                ),
                                Icon(Icons.skip_previous,
                                    color: Colors.white, size: Get.width / 10),
                                const SizedBox(
                                  width: 30,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.repeat,
                                        color: Colors.white,
                                        size: Get.width / 13)),
                                const SizedBox.shrink(),
                              ],
                            )
                          ],
                        ),
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
