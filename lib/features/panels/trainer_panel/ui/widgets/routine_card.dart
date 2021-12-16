import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/no.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/yes.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/sportsman/sportsman_photo_detail.dart';

import 'create_schedule_button.dart';

class RoutineCard extends StatefulWidget {
  final TrainerPanelSportsmanResponseModel routine;
  final TrainerPanelSportsmanNestedNo service;
  final List<TrainerPanelSportsmanNestedYes> history;

  const RoutineCard({
    Key key,
    this.routine,
    this.service,
    this.history,
  }) : super(key: key);

  @override
  _RoutineCardState createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  bool _canCreateSchedule = true;

  CountdownTimerController _countdownTimerController;

  final DateTime _currentDate = DateTime.now();
  DateTime _startDate = DateTime.now();
  DateTime _endDate;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void initState() {
    _startDate = DateTime.parse(widget.routine.startDate);
    _endDate = DateTime.parse(widget.routine.endDate);

    // endTime = _startDate
    //     .add(
    //       const Duration(hours: 24),
    //     )
    //     .difference(_currentDate)
    //     .inMilliseconds;

    _countdownTimerController = CountdownTimerController(
      endTime: endTime,
      onEnd: onEnd,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final warningText = ln(context, 'order_warning');
    const String daysLeftText = "28 days left";

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => SportsmanPhotosDetail(
                sportsmanId: widget.routine.sportsman,
              ),
            ),
          );
        },
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
            elevation: 2,
            color: AppColors.darkModeBlack,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            margin: EdgeInsets.zero,
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 5,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              widget.routine.username,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        CreateScheduleButton(
                          history: widget.history,
                          routine: widget.routine,
                          service: widget.service,
                          isActive: _canCreateSchedule,
                        )
                      ],
                    ),
                    Text(
                      widget.service.name,
                      style: TextStyle(
                        color: AppColors.subtitleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // delete this shit if it keeps failing
                    //TODO
                    CountdownTimer(
                      controller: _countdownTimerController,
                      endTime: 2000,
                      onEnd: onEnd,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onEnd() {
    print("ended >>>>>>>>>>>>>>");
    setState(() {
      _canCreateSchedule = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class RoutineCardOld extends StatelessWidget {
  final TrainerPanelSportsmanResponseModel routine;
  final TrainerPanelSportsmanNestedNo service;
  final List<TrainerPanelSportsmanNestedYes> history;

  const RoutineCardOld({
    Key key,
    this.routine,
    this.service,
    this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => SportsmanPhotosDetail(
                sportsmanId: routine.sportsman,
              ),
            ),
          );
        },
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
              )
            ],
          ),
          child: Card(
            elevation: 2,
            color: AppColors.darkModeBlack,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            margin: EdgeInsets.zero,
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppColors.primaryColor,
                      width: 5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                routine.username,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  color: AppColors.messageColor.withOpacity(.6),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 6,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          ln(context, 'sample_message_1'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: AppColors.primaryColor,
                              child: InkWell(
                                onTap: () {
                                  navigateToRoute(
                                    context,
                                    Routes
                                        .trainerPanelSportsman1UserDetailWidget,
                                    routeArgs:
                                        TrainerPanelSportsman1UserDetailWidgetArguments(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                          ),
                        ],
                      ),
                      Text(
                        service.name,
                        style: TextStyle(
                          color: AppColors.subtitleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        ln(context, 'order_warning'),
                        style: TextStyle(
                          color: AppColors.crossColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
