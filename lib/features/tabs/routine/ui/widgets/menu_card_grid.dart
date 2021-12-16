import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';

class MenuGridCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget backgroundIcon;
  final String bgText;
  final Color color;
  final String label;

  const MenuGridCard({
    @required this.onTap,
    @required this.backgroundIcon,
    @required this.bgText,
    @required this.color,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: backgroundIcon,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Text(
                  bgText,
                  style: TextStyle(
                    color: AppColors.white.withOpacity(.30),
                    fontSize: 120,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 20,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
