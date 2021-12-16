import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';


class ListViewTitle extends StatelessWidget {
  final VoidCallback onTap;
  final String title;


  ListViewTitle({@required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    //TODO add translator

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        // height: size.height * 0.1,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0
              ),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  String translatedText(BuildContext context){
    String _translated = ln(context, title);
    return _translated;
  }
}
