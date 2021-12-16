import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';

import 'control_button.dart';

class ServiceItemLTile extends StatelessWidget {
  final TrainerPanelServiceResponseModel service;
  final bool isHidden;

  const ServiceItemLTile({@required this.service, this.isHidden = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        margin: const EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 3,
                offset: const Offset(2, 2),
              ),
            ],
        ),
        child: Card(
          color: AppColors.darkModeBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        service.name,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          if (service.is_exercise)
                            Text(
                              ln(context, 'exercise'),
                              style: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (service.is_nutrition)
                            Text(
                              ln(context, 'nutrition'),
                              style: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (service.is_supplement)
                            Text(
                              ln(context, 'supplementary_food'),
                              style: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                Switch(
                  onChanged: (bool value) {

                  },
                  value: !isHidden,
                ),
                const SizedBox(width: 5,),
                ControlButton(service: service),
              ],
            ),
          ),
        ),
      ),
    );
  }
}