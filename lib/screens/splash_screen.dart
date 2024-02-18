import 'package:common_layout_setup_kit/screens/splash_screen_controller.dart';
import 'package:common_layout_setup_kit/utils/common_appbar.dart';
import 'package:common_layout_setup_kit/utils/common_scaffold.dart';
import 'package:common_layout_setup_kit/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({
    super.key,
    required this.homeScreen,
    required this.gradientColorList,
    required this.bannerAssetPath,
    required this.spalshLogoAssetPath,
  }) {
    controller = Get.put(SplashScreenController(
      homeScreen: homeScreen,
    ));
  }

  final Widget homeScreen;
  final List<Color> gradientColorList;
  final String bannerAssetPath;
  final String spalshLogoAssetPath;

  late final SplashScreenController controller;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      gradientColorList: gradientColorList,
      child: Column(
        children: [
          CommonAppbar(
            bannerAssetPath: bannerAssetPath,
          ),
          12.verticalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedLogo(
                  splashLogoAssetPath: spalshLogoAssetPath,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({
    super.key,
    required this.splashLogoAssetPath,
  });

  final String splashLogoAssetPath;

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    sizeAnimation =
        Tween<double>(begin: 50, end: 600).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.3),
                ])),
            child: Image.asset(
              widget.splashLogoAssetPath,
              width: sizeAnimation.value,
              height: sizeAnimation.value,
            ),
          ),
          12.verticalSpace,
          Text(
            "Friends of your car",
            style: Get.textTheme.bodyLarge?.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
