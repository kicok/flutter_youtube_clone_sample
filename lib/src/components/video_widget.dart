import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone_sample/src/models/video.dart';
import 'package:flutter_youtube_clone_sample/src/util/utils.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatelessWidget {
  final Video video;
  const VideoWidget({Key? key, required this.video}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        video.snippet.thumbnails.medium.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          Utils.myAvatar(),
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
                        video.snippet.title,
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
                      video.snippet.channelTitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const Text("ㆍ"),
                    Text(
                      "조회수 1,000회",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const Text("ㆍ"),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(video.snippet.publishTime),
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
