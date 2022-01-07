import 'package:flutter_youtube_clone_sample/src/controller/app_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
