import 'package:flutter_youtube_clone_sample/src/models/statistics.dart';
import 'package:flutter_youtube_clone_sample/src/models/video.dart';
import 'package:flutter_youtube_clone_sample/src/models/youtuber.dart';
import 'package:flutter_youtube_clone_sample/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  late Video video;
  VideoController({required this.video});

  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);

    Youtuber? loadYoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadYoutuber);

    super.onInit();
  }

  String get viewCountString => "조회수: ${statistics.value.viewCount ?? '-'}회";

  String get youtuberThumbNailUrl {
    if (youtuber.value.snippet == null) {
      return "https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png";
    }
    return youtuber.value.snippet!.thumbnails.medium.url;
  }
}
