import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  String key = "searchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  //빈 목록을 새로 만든다. growable: true 이면 가변 리스트 (growable: true)

// RxList<String> history2 = [""].obs;
  // 위와 같은 방식으로 초기화 해도 괜찮다.
  //RxList<String> history2 = [].obs; // [] 이렇게 처리햐면 앞에서 제네릭을 String 을 처리해준다해도 dynamic으로 인식되므로 에러

  late SharedPreferences profs;

  @override
  void onInit() async {
    profs = await SharedPreferences.getInstance();

    List<String> initData = profs.getStringList(key) ?? [];
    // 처츰 로딩 될때 SharedPreferences 에 저장된 정보를 불러와 저장한다
    history(initData);

    super.onInit();
  }

  void search(String value) {
    history.remove(value); // 검색어 중복 제거
    history.add(value); // 검색어를 List 마지막위치에 저장
    profs.setStringList(key, history);
  }
}
