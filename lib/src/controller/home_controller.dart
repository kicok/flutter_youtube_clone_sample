import 'package:flutter/widgets.dart';
import 'package:flutter_youtube_clone_sample/src/models/youtube_video_results.dart';
import 'package:flutter_youtube_clone_sample/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _scrollEvent();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _scrollEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPageToken != "") {
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadVideos(youtubeResult.value.nextPageToken ?? "");
    // 다음페이지가 더이상 없다면 nextPageToken 이 null 이므로 null 을 대신해 "" 을 전달

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.isNotEmpty) {
      // youtubeResult(youtube);
      // 위의 코드를 사용하면 페이지 이동이 되지 않으므로
      // 아래의 코드처럼 update를 통해 youtube.items를 계속 추가 해야한다.
      youtubeResult.update((youtube) {
        // update를 통해 youtube.items를 계속 추가 해야한다.
        // .map 을 통해 List Iterable 로 변환함
        youtube!.items!.addAll(youtubeVideoResult.items!.map((video) => video));
        // 반드시 Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs; 형태로 items를 초기화해야 한다.
        // 쵸기화를 하지 않으면 youtube!.items!.addAll(..)에서 items null 에러(_CastError (Null check operator used on a null value))

        // nextPageToken 을 전달
        youtube.nextPageToken = youtubeVideoResult.nextPageToken;
      });
    }
  }
}
