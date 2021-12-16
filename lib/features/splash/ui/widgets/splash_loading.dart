import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/router/router.gr.dart';

class SplashLoading extends StatefulWidget {
  @override
  _SplashLoadingState createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoading>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  //animated splash
  _startAnimation() {
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 1, microseconds: 500));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
          ..addListener(() {
            if (animationController.isCompleted) {
              navigateToRoute(context, Routes.homeScreen);
            }
            setState(() {});
          });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: <Widget>[
          Spacer(),
          Image.asset(
            'assets/images/logo.png',
            width: animation.value * 250,
            height: animation.value * 250,
          ),
          Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/powered_by.png',
                height: 25,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
