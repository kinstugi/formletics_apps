import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';

class CustomLineTextField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const CustomLineTextField({
    Key key,
    this.hint,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
