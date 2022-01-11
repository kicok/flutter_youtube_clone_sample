import 'package:flutter_youtube_clone_sample/src/models/youtube_video_results.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  //GetConnect는 http나 websockets으로 프론트와 백엔드의 통신을 위한 쉬운 방법
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos() async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UChlv4GSd7OQl3js-jkLOnFA&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyD_xKuiNlnUuFRTZPNKiUtKUmM7cIHXaIk";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
}
