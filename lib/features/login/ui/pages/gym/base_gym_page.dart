import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/widgets/auth_buttons/custom_auth_button.dart';
import 'package:formletics/widgets/auth_buttons/logo_text.dart';

import 'gym_login_page.dart';
import 'gym_register.dart';

class BaseGymPage extends StatelessWidget {
  const BaseGymPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: kBottomNavigationBarHeight),
            const Expanded(child: LogoText()),
            CustomAuthButtom(
              btnText: 'Gym',
              color: AppColors.primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const GymLoginPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            CustomAuthButtom(
              btnText: 'Register a gym',
              color: Colors.black.withOpacity(0.75),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const GymRegisterPage(),
                  ),
                );
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "User Login",
              ),
            ),
            const SizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}
