import 'package:flutter/material.dart';

class Utils {
  static Widget myAvatar() {
    return CircleAvatar(
      radius: 30, // size 조절
      backgroundColor: Colors.grey.withOpacity(0.5),
      backgroundImage: Image.network(
              "https://yt3.ggpht.com/ytc/AKedOLQagIEl2WOUacXZ8WlCPvApoIouP9sNGkMIDVdQ=s48-c-k-c0x00ffffff-no-rj")
          .image, // .image 를 하면 Image 타입을 ImageProvider 타입으로 바꿔줄수 있ㅏ.
    );
  }
}
