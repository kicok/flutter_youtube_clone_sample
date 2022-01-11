import 'package:flutter_youtube_clone_sample/src/models/statistics.dart';
import 'package:flutter_youtube_clone_sample/src/models/video.dart';
import 'package:flutter_youtube_clone_sample/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  late Video video;
  VideoController({required this.video});

  Rx<Statistics> statistics = Statistics().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    super.onInit();
  }

  String get viewCountString => "조회수: ${statistics.value.viewCount ?? '-'}회";
}
