import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  SplashScreenController({required this.homeScreen});
  final Widget homeScreen;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(() => homeScreen);
      },
    );
  }
}
