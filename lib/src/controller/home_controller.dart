import 'package:flutter_youtube_clone_sample/src/models/youtube_video_results.dart';
import 'package:flutter_youtube_clone_sample/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult().obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult =
        await YoutubeRepository.to.loadVideos();
    print(youtubeVideoResult!.items?.length.toString());

    if (youtubeVideoResult != null && youtubeVideoResult.items != null) {
      youtubeResult(youtubeVideoResult);
    }
  }
}
