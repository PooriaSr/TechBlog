import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/models/podcast_info_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class PodcastController extends GetxController {
  RxList<PodcastModel> podcastList = RxList();
  RxList<PodcastFileModel> podcastFiles = RxList();
  RxBool loading = false.obs;
  Rx<PodcastModel> podcastInfo = PodcastModel().obs;

  @override
  onInit() {
    super.onInit();
    getNewPodcastsList();
    //TODO: call this method in PodcastListScreen
    //getPodcastFile('2');
  }

  getNewPodcastsList() async {
    //TODO: concat userId to url
    loading.value = T;
    var response =
        await DioService().getMethod(ApiUrlConstant.getNewPodcastsList);
    if (response.statusCode == 200) {
      for (var element in response.data) {
        podcastList.add(PodcastModel.fromJson2(element));
      }
      loading.value = F;
    }
  }

  getPodcastFile(String podcastId) async {
    loading.value = true;
    var response =
        await DioService().getMethod(ApiUrlConstant.getPodcastFile + podcastId);
    if (response.statusCode == 200) {
      response.data['files'].forEach((element) {
        podcastFiles.add(PodcastFileModel.fromJson(element));
      });

      loading.value = false;
    }
  }

  goToSinglePodcast(String id, int index) {
    Get.toNamed(NamedRoute.singlePodcastScreen);
    getPodcastFile(id);

    podcastInfo.value = podcastList[index];
  }
}
