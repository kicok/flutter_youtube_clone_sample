import 'package:flutter/material.dart';

class Utils {
  static Widget myAvatar(String url) {
    url = url != ""
        ? url
        : "https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png";

    return CircleAvatar(
      radius: 30, // size 조절
      backgroundColor: Colors.grey.withOpacity(0.5),
      backgroundImage: Image.network(url)
          .image, // .image 를 하면 Image 타입을 ImageProvider 타입으로 바꿔줄수 있ㅏ.
    );
  }
}
