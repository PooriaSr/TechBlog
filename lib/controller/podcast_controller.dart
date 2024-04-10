import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/models/podcast_file_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class PodcastController extends GetxController {
  RxList<PodcastModel> podcastList = RxList();
  RxList<PodcastFileModel> podcastFiles = RxList();
  RxBool loading = false.obs;
  Rx<PodcastModel> podcastInfo = PodcastModel().obs;
  final player = AudioPlayer();
  late ConcatenatingAudioSource playList;
  RxBool playState = F.obs;

  @override
  onInit() {
    super.onInit();
    getNewPodcastsList();
    playList = ConcatenatingAudioSource(
        children: [],
        shuffleOrder: DefaultShuffleOrder(),
        useLazyPreparation: T);
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
    podcastFiles.clear();
    loading.value = true;
    var response =
        await DioService().getMethod(ApiUrlConstant.getPodcastFile + podcastId);
    if (response.statusCode == 200) {
      response.data['files'].forEach((element) {
        podcastFiles.add(PodcastFileModel.fromJson(element));
        playList.add(AudioSource.uri(
            Uri.parse(PodcastFileModel.fromJson(element).file!)));
      });
      await player.setAudioSource(playList,
          initialIndex: 0, initialPosition: Duration.zero);

      loading.value = false;
    }
  }

  goToSinglePodcast(String id, int index) {
    Get.toNamed(NamedRoute.singlePodcastScreen);
    getPodcastFile(id);

    podcastInfo.value = podcastList[index];
  }

  playButton() {
    playState.value == true ? player.pause() : player.play();

    playState.value = player.playing;
  }

  playOnTitle(int index) async {
    await player.seek(Duration.zero, index: index);
    player.play();
    playState.value = player.playing;
  }

  skipNextButton() async {
    await player.seekToNext();
  }

  skipPreviousButton() async {
    await player.seekToPrevious();
  }
}
