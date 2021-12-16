import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/ui/pages/login.dart';
import 'package:formletics/widgets/auth_buttons/custom_auth_button.dart';
import 'package:formletics/widgets/auth_buttons/logo_text.dart';

import 'gym/base_gym_page.dart';
import 'trainer/base_trainer_page.dart';

//import 'base_trainer_page.dart';

class RootAuthTrainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: kBottomNavigationBarHeight),
          Expanded(child: _logoText(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _instructorLoginButton(context, size),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _instructorSignUpButton(context, size),
          ),
          FlatButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) => const CustomPopUpWidget(),
              );
            },
            child: Text(ln(context, 'business_panel')),
          ),
          const SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
    );
  }

  Widget _logoText(BuildContext context) {
    return const LogoText();
  }

  Widget _instructorLoginButton(BuildContext context, Size size) {
    return CustomAuthButtom(
      btnText: ln(context, 'login_btn_text'),
      color: AppColors.primaryColor,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const LoginScreen(actualPage: true),
          ),
        );
      },
    );
  }

  Widget _instructorSignUpButton(BuildContext context, Size size) {
    return CustomAuthButtom(
      btnText: ln(context, 'register'),
      color: const Color.fromRGBO(0, 0, 0, 0.75),
      onPressed: () {},
    );
  }
}

class CustomPopUpWidget extends StatelessWidget {
  const CustomPopUpWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 15,
                bottom: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Text(
                    ln(context, "register_type"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 45),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const BaseTrainerPage(),
                        ),
                      );
                    },
                    color: Colors.blueAccent,
                    minWidth: size.width,
                    child: Text(
                      ln(context, "select_trainer"),
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  const SizedBox(height: 15),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const BaseGymPage(),
                      ));
                    },
                    color: Colors.blueAccent,
                    minWidth: size.width,
                    child: Text(
                      ln(context, "select_gym"),
                      style: Theme.of(context).textTheme.button,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
