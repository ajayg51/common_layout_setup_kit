import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  
  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: Column(
        children: [
          const CommonAppbar(),
          12.verticalSpace,
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

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
              Assets.car,
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
