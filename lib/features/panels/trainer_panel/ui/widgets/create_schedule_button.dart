import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/no.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/yes.dart';

class CreateScheduleButton extends StatelessWidget {
  final TrainerPanelSportsmanResponseModel routine;
  final TrainerPanelSportsmanNestedNo service;
  final List<TrainerPanelSportsmanNestedYes> history;
  final bool isActive;

  const CreateScheduleButton({
    this.history,
    this.routine,
    this.service,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isActive) {
      return InkWell(
        onTap: () {},
        child: Card(
          margin: EdgeInsets.zero,
          color: AppColors.black.withAlpha(120),
          child: InkWell(
            onTap: () {}, //TODO no click handler
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.grey,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ln(context, 'create'),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.primaryColor,
        child: InkWell(
          onTap: () {
            navigateToRoute(
              context,
              Routes.trainerPanelSportsman1UserDetailWidget,
              routeArgs: TrainerPanelSportsman1UserDetailWidgetArguments(
                routine: routine,
                service: service,
                history: history,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 14,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  ln(context, 'create'),
                  style: const TextStyle(
                    fontSize: 12,
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
