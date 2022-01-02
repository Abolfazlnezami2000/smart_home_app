import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcco/view/page/give_wifi_data_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

class Devise {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Devise> device = <Devise>[];
  void test()async{
    AndroidIntent intent = AndroidIntent(
      action: 'android.settings.ACTION_WIFI_SETTINGS',
    );
    await intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TCCO"),
        centerTitle: true,
        actions: [
          IconButton(
            // onPressed: () {
            //   test();
            //   // Get.to(GiveWifiDataPage());
            //
            // },
            onPressed: AppSettings.openWIFISettings,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: ()=> Get.to(GiveWifiDataPage()),
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 3, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "Add Devise",
                    style: TextStyle(
                        fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
