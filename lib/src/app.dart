import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_youtube_clone_sample/src/pages/explore.dart';
import 'package:flutter_youtube_clone_sample/src/pages/home.dart';
import 'package:flutter_youtube_clone_sample/src/pages/library.dart';
import 'package:flutter_youtube_clone_sample/src/pages/subscribe.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.home:
            return const Home();
          case RouteName.explore:
            return const Explore();
          // case RouteName.add:
          //   return const Home();
          case RouteName.subs:
            return const Subscribe();
          case RouteName.library:
            return const Library();
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          //showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/compass_off.svg",
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/compass_on.svg",
                width: 22,
              ),
              label: "탐색",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/svg/icons/plus.svg",
                  width: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
