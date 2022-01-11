import 'package:flutter_youtube_clone_sample/src/components/youtube_bottom_sheet.dart';
import 'package:get/get.dart';

enum RouteName { home, explore, add, subs, library }

class AppController extends GetxService {
  //static AppController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(const YoutubeBottomSheet());
  }
}
