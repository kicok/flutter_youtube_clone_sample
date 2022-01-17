import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_youtube_clone_sample/src/components/video_widget.dart';
import 'package:flutter_youtube_clone_sample/src/controller/youtube_search_controller.dart';
import 'package:get/get.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  const YoutubeSearch({Key? key}) : super(key: key);

  Widget _searchHistory() {
    return ListView(
      children: List.generate(
        controller.history.length,
        (index) => ListTile(
          onTap: () {
            //  print(controller.history[controller.history.length - index - 1]);
            controller.search(
                controller.history[controller.history.length - index - 1]);
          },
          leading:
              SvgPicture.asset("assets/svg/icons/wall-clock.svg", width: 20),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child:
                Text(controller.history[controller.history.length - index - 1]),
            // 검색 키워드를 최근것이 상단으로 보여주기
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ),
      ),
    );
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: List.generate(
            controller.youtubeVideoResult.value.items!.length, (index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                  "/detail/${controller.youtubeVideoResult.value.items![index].id.videoId}");
            },
            child: VideoWidget(
                video: controller.youtubeVideoResult.value.items![index]),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.find<YoutubeSearchController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset("assets/svg/icons/back.svg"),
            onPressed: Get.back,
          ),
          title: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onSubmitted: (value) {
              print("onSubmitted : $value");
              controller.search(value);
            },
          ),
        ),
        body: Obx(
          () => controller.youtubeVideoResult.value.items!.isNotEmpty
              ? _searchResultView()
              : _searchHistory(),
          //() => _searchHistory(),
        ));
  }
}
