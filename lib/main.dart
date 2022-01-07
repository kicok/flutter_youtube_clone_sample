import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Youtube Clone App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const App(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const App()),
      ],
    );
  }
}
