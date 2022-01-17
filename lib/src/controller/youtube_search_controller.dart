import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone_sample/src/models/youtube_video_results.dart';
import 'package:flutter_youtube_clone_sample/src/repository/youtube_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  String key = "searchKey";
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();
  late String currentKeyword;
  RxList<String> history = RxList<String>.empty(growable: true);
  //빈 목록을 새로 만든다. growable: true 이면 가변 리스트 (growable: true)

// RxList<String> history2 = [""].obs;
  // 위와 같은 방식으로 초기화 해도 괜찮다.
  //RxList<String> history2 = [].obs; // [] 이렇게 처리햐면 앞에서 제네릭을 String 을 처리해준다해도 dynamic으로 인식되므로 에러

  late SharedPreferences profs;

  @override
  void onInit() async {
    _eventScoller();
    profs = await SharedPreferences.getInstance();

    List<String> initData = profs.getStringList(key) ?? [];
    // 처츰 로딩 될때 SharedPreferences 에 저장된 정보를 불러와 저장한다
    history(initData);

    super.onInit();
  }

  void _eventScoller() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != "") {
        _searchYoutube(currentKeyword);
        print(youtubeVideoResult.value.nextPageToken);
      }
    });
  }

  void search(String value) {
    history.remove(value); // 검색어 중복 제거
    history.add(value); // 검색어를 List 마지막위치에 저장
    profs.setStringList(key, history);
    currentKeyword = value;

    // 새로운 검색이 들어오면 기존의 검색의 결과는 없애고 초기화한다.
    if (youtubeVideoResult.value.items!.isNotEmpty) {
      youtubeVideoResult(YoutubeVideoResult(items: []));
    }
    _searchYoutube(value);
  }

  void _searchYoutube(String value) async {
    YoutubeVideoResult? youtubeVideoResultFromServer = await YoutubeRepository
        .to
        .search(value, youtubeVideoResult.value.nextPageToken ?? "");
    // youtubeVideoResult(youtubeVideoResultFromServer);

    //Home._videoLoad() 같은 로직을 사용함
    if (youtubeVideoResultFromServer != null &&
        youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items!.isNotEmpty) {
      youtubeVideoResult.update((youtube) {
        youtube!.items!
            .addAll(youtubeVideoResultFromServer.items!.map((video) => video));
        youtube.nextPageToken = youtubeVideoResultFromServer.nextPageToken;
      });
    }
  }
}
