import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tcco/view/page/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  /// check cash and show result on ui if is exist push main else push login page
  void _checkUser() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAll(MainPage());
  }

  @override
  void initState() {
    _checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 300,
            width: 300,
          ),
          const SizedBox(
            height: 100,
          ),
          const SpinKitSpinningLines(
            color: Colors.blueAccent,
            size: 60.0,
          ),
        ],
      ),
    );
  }
}