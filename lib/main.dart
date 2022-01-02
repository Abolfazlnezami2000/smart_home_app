import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tcco/view/page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.location.request();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TCCO",
      home: SplashPage(),
    );
  }
}

