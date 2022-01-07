import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  const YoutubeBottomSheet({Key? key}) : super(key: key);

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "만들기",
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: Get.back,
        )
      ],
    );
  }

  Widget _itemButton({
    required String icon,
    required double iconSize,
    required String label,
    required Function onTap,
  }) {
    return InkWell(
      onTap: onTap(),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/icons/$icon",
                width: iconSize,
                height: iconSize,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 10),
            _itemButton(
                icon: "upload.svg",
                iconSize: 17,
                label: "동영상 업로드",
                onTap: () {
                  print('동영상 업로드 기능!!!');
                }),
            const SizedBox(height: 10),
            _itemButton(
                icon: "broadcast.svg",
                iconSize: 25,
                label: "실시간 스트리밍 시작",
                onTap: () {
                  print('실시간 스트리밍 시작');
                }),
          ],
        ),
      ),
    );
  }
}
