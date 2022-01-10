import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone_sample/src/components/custom_appbars.dart';
import 'package:flutter_youtube_clone_sample/src/components/video_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
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
                onTap: () {},
                child: const VideoWidget(),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    ));
  }
}
