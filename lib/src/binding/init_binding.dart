import 'package:flutter_youtube_clone_sample/src/controller/app_controller.dart';
import 'package:flutter_youtube_clone_sample/src/repository/youtube_repository.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(YoutubeRepository(), permanent: true);
  }
}
