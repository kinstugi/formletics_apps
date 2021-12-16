import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'FORM',
          style: Theme.of(context).textTheme.headline3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          children: [
            TextSpan(
              text: 'LETICS',
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ]),
    );
  }
}
