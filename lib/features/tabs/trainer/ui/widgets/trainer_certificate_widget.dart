import 'package:flutter/material.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
// import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';


class TrainerCertificateWidget extends StatelessWidget {
  final String certName;
  final String description;

  const TrainerCertificateWidget({this.certName, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          navigateToRoute(
            context,
            Routes.trainerDetailWidget,
          );
        },
        child: AspectRatio(
          aspectRatio: 1.7 / 1,
          child: Card(
            color: AppColors.purple.withOpacity(0.2),
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        certName,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            color:
                            AppColors.subtitleColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}