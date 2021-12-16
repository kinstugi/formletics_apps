import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';

class CustomRecButton extends StatelessWidget {
  final String text;
  final Icon icon;

  const CustomRecButton({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 1,
        child: RaisedButton(
          color: AppColors.primaryColor,
          textColor: AppColors.white,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              if (icon != null) icon,
            ],
          ),
        ),
      ),
    ]);
  }
}
