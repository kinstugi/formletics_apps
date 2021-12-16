import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';

class CustomAuthButtom extends StatelessWidget {
  const CustomAuthButtom({
    this.onPressed,
    this.btnText,
    this.color,
  });

  final VoidCallback onPressed;
  final Color color;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: kBottomNavigationBarHeight,
      child: RaisedButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        child: Text(
          btnText,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
    ;
  }
}
