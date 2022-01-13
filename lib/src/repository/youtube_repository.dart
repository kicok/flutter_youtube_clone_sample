import 'package:flutter_youtube_clone_sample/src/models/statistics.dart';
import 'package:flutter_youtube_clone_sample/src/models/youtube_video_results.dart';
import 'package:flutter_youtube_clone_sample/src/models/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  //GetConnect는 http나 websockets으로 프론트와 백엔드의 통신을 위한 쉬운 방법
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  String apiKey = "AIzaSyBO_4fN0B0mAJ2mrWMJpjblC9uKbu1hFuQ";
  //String apiKey = "AIzaSyD_xKuiNlnUuFRTZPNKiUtKUmM7cIHXaIk";

  Future<YoutubeVideoResult?> loadVideos(String nextPageToken) async {
    print(nextPageToken);
    String url =
        "/youtube/v3/search?part=snippet&channelId=UChlv4GSd7OQl3js-jkLOnFA&maxResults=10&order=date&type=video&videoDefinition=high&key=$apiKey&pageToken=$nextPageToken";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics?> getVideoInfoById(String videoId) async {
    String url = "/youtube/v3/videos?part=statistics&key=$apiKey&id=$videoId";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=$apiKey&id=$channelId";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
