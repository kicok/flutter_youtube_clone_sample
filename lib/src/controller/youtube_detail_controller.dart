import 'package:flutter_youtube_clone_sample/src/controller/video_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YoutubeDetailController extends GetxController {
  late VideoController videoController;

  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters['videoId']);
    // 이미 리스트에서 개별 Video에 대한 정보가 있으므로 그것을 videoController를 통해서 호출해오면 된다.
    print(videoController.video.snippet.title);
    super.onInit();
  }

  String get title => videoController.video.snippet.title;
  String get description => videoController.video.snippet.description;
  String get likeCount => "${videoController.statistics.value.likeCount}";
  String get viewCount => "조회수 ${videoController.statistics.value.viewCount}회";
  String get publishedTime => DateFormat("yyyy-MM-dd")
      .format(videoController.video.snippet.publishTime);
  String get youtuberThumbNail => videoController.youtuberThumbNailUrl;
  String get youtuberName => videoController.youtuber.value.snippet!.title;
  String get subscriberCount =>
      "${videoController.youtuber.value.statistics!.subscriberCount}";
}
