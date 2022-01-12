import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone_sample/src/controller/video_controller.dart';
import 'package:flutter_youtube_clone_sample/src/models/video.dart';
import 'package:flutter_youtube_clone_sample/src/util/utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  //final VideoController controller = Get.put(VideoController(), tag:  widget.video.id.videoId);
  //final VideoController controller = Get.put(VideoController(), tag:  video.id.videoId);
  // 멤버 변수 형태로 인스턴스를 만들면 같은 멤버변수인 video에 접근할수 없음
  // 그러므로 statefulWidget 으로 변경해서 lifeCycle상의 initState() 에서 인스턴스를 생성하는것이 좋을거 같음.

  late VideoController _videoController;
  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
    // 유튜브 영상이 여러개있으므로 갯수에 맞춰서 인스턴스가 필요
    // tag 를 이용하여 single인스턴스가 아닌 여러개의 인스턴스를 생성한다.
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          //height: 250,
          color: Colors.grey.withOpacity(0.5),
          child: Image.network(
            widget.video.snippet.thumbnails.medium.url,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          Obx(
            () => Utils.myAvatar(_videoController.youtuberThumbNailUrl),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      //maxLines 을 사용하고 Expanded로 감싸주면 줄 바꾸기가 된다.
                      child: Text(
                        widget.video.snippet.title,
                        maxLines: 2,
                        //maxLines 을 사용하고 Expanded로 감싸주면 줄 바꾸기가 된다.
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: const Icon(Icons.more_vert, size: 18),
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.video.snippet.channelTitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const Text("ㆍ"),
                    Obx(
                      () => Text(
                        _videoController.viewCountString,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    const Text("ㆍ"),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(widget.video.snippet.publishedAt),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }
}
