import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/features/splash/ui/widgets/splash_loading.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);
    _disposers ??= [
      reaction(
        (_) => _loginStore.isLoggedIn,
        (bool isLoggedIn) {
          if (getCurrentScreen(context) != Routes.splashScreen) {
            return;
          }
          // TODO REMOVE THIS COMMENT FOR ADD USER LOGIN
          handleIsLoggedIn(isLoggedIn: isLoggedIn);
        },
      ),
    ];
  }

  void handleIsLoggedIn({bool isLoggedIn}) {
    navigateToHome(context);
  }

  Widget buildFirstScreen(BuildContext context) {
    return SplashLoading();
  }

  //animated splash
  void _startAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1, microseconds: 500));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut)
      ..addListener(() {
        if (animationController.isCompleted) {
          handleIsLoggedIn(isLoggedIn: true);
        }
        setState(() {});
      });
    animationController.forward();
  }

  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    if (_disposers != null) {
      _disposers.map((a) {
        a();
      });
    }
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
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
              child: Column(
                children: [
                  Text(
                    " ",
                    style: TextStyle(fontSize: 8, color: AppColors.white.withOpacity(0.6)),
                  ),
                  Container(height: 50.0,)
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
