import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_youtube_clone_sample/src/util/utils.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  const YoutubeDetail({Key? key}) : super(key: key);

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "개발하는남자 유튜브 영상 다시보기",
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(
                "조회수 1,000회",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const Text(" ㆍ "),
              Text(
                "2022-01-10",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _descriptionZone() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        "안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. 안녕하세요. 개발하는 남자 개남입니다. ",
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buttonOne(String iconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset("assets/svg/icons/$iconPath.svg"),
        Text(text),
      ],
    );
  }

  Widget _bottomZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne("like", "1,000"),
        _buttonOne("dislike", "1,000"),
        _buttonOne("share", "1,000"),
        _buttonOne("save", "1,000"),
      ],
    );
  }

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Utils.myAvatar(),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "개발하는남자",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "구독자 10,000",
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: const Text(
              "구독",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          const Divider(),
          _descriptionZone(),
          _bottomZone(),
          const Divider(height: 20),
          _ownerZone(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: _description(),
          ),
        ],
      ),
    );
  }
}
