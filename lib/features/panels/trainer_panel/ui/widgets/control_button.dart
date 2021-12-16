import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/service/service_add.dart';

class ControlButton extends StatelessWidget {
  final TrainerPanelServiceResponseModel service;


  const ControlButton({@required this.service});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final bool res = await Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => TrainerPanelServiceAddWidget(
              model: service,
            )
        ));

        //TODO refresh screen
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.deleteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.pencilAlt,
                color: AppColors.iconColor,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                ln(context, 'edit'),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

