import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcco/controller/wifi_controller.dart';

// ignore: must_be_immutable
class GiveWifiDataPage extends StatelessWidget {
  GiveWifiDataPage({Key? key}) : super(key: key);

  final GiveWifiDataController _controller = GiveWifiDataController();
  final TextEditingController _wifiNameController = TextEditingController();
  final TextEditingController _wifiPasswordController = TextEditingController();

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    _controller.getWifiData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Please Enter wifi Data"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_controller.status == Status.hasData) {
          return _body();
        } else if (_controller.status == Status.noWifi) {
          return const Center(child: Text("please connect to Wifi"));
        } else if (_controller.status == Status.error) {
          return const Center(child: Text("Error"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Container _body() {
    _wifiNameController.text = _controller.wifiData.wifiName;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          _textField(
              controller: _wifiNameController,
              hintText: "Please enter wifi name"),
          _textField(
              controller: _wifiPasswordController,
              hintText: "Please enter wifi password"),
          Spacer(),
          _button(),
        ],
      ),
    );
  }

  Container _textField(
      {required TextEditingController controller, required String hintText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  InkWell _button() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
