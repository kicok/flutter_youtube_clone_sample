import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone_sample/src/util/utils.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
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
                    const Expanded(
                      //maxLines 을 사용하고 Expanded로 감싸주면 줄 바꾸기가 된다.
                      child: Text(
                        "스페셜 유튜브 다시보기 스페셜 유튜브 다시보기 스페셜 유튜브 다시보기 스페셜 유튜브 다시보기 스페셜 유튜브 다시보기 ",
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
                      "3프로 TV",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const Text(" ㆍ "),
                    Text(
                      "조회수: 1,000회",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const Text(" ㆍ "),
                    Text(
                      "2022-01-10",
                      style: TextStyle(
                        fontSize: 12,
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
