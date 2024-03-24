import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/controller/podcast_controller.dart';

class PodcastListScreen extends StatelessWidget {
  PodcastListScreen({super.key});
  //TODO: change to variable after route managing
  final PodcastController podcastController = Get.put(PodcastController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('لیست پادکست ها'),
      body: SafeArea(
          child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: ListView.builder(
                  itemCount: podcastController.podcastList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () => podcastController.goToSinglePodcast(
                          podcastController.podcastList[index].id!, index),
                      child: Row(
                        children: [
                          //podcast image
                          SizedBox(
                            width: Get.width / 3.7,
                            height: Get.height / 8,
                            child: CachedNetworkImage(
                              imageUrl:
                                  podcastController.podcastList[index].poster!,
                              placeholder: (context, url) =>
                                  const SpinKitLoading(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                              errorWidget: (context, url, error) => ErrorImage(
                                  width: Get.width / 3.7,
                                  height: Get.height / 8),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          //Title&Author text
                          SizedBox(
                            height: Get.height / 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(podcastController
                                    .podcastList[index].title!),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(podcastController
                                        .podcastList[index].author ??
                                    'null')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
