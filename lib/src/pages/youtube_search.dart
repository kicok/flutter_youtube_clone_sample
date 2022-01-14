import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class YoutubeSearch extends StatelessWidget {
  const YoutubeSearch({Key? key}) : super(key: key);

  Widget _searchHistory() {
    return ListView(
      children: List.generate(
        10,
        (index) => ListTile(
          leading:
              SvgPicture.asset("assets/svg/icons/wall-clock.svg", width: 20),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("개발하는 남자 $index"),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
      body: _searchHistory(),
    );
  }
}
