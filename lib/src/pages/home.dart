import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone_sample/src/components/custom_appbars.dart';
import 'package:flutter_youtube_clone_sample/src/components/video_widget.dart';
import 'package:flutter_youtube_clone_sample/src/controller/home_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              const SliverAppBar(
                title: CustomAppBar(),
                floating: true,
                snap: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/detail/1235");
                      },
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items![index]),
                    );
                  },
                  childCount: controller.youtubeResult.value.items == null
                      ? 0
                      : controller.youtubeResult.value.items!.length,
                ),
              ),
            ],
          )),
    );
  }
}
