import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/no.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/yes.dart';
import 'package:getwidget/getwidget.dart';

class TrainerPanelSportsman1UserDetailWidget extends StatefulWidget {
  @required
  TrainerPanelSportsmanResponseModel routine;
  @required
  TrainerPanelSportsmanNestedNo service;
  @required
  List<TrainerPanelSportsmanNestedYes> history;

  TrainerPanelSportsman1UserDetailWidget(
      {Key key, this.routine, this.service, this.history})
      : super(key: key);

  @override
  _TrainerPanelSportsman1UserDetailWidgetState createState() =>
      _TrainerPanelSportsman1UserDetailWidgetState();
}

class _TrainerPanelSportsman1UserDetailWidgetState
    extends State<TrainerPanelSportsman1UserDetailWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
          title: Text(ln(context, 'schedules'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14)
        )
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 3,
                    bottom: 3,
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ]),
                  child: Card(
                    color: AppColors.darkModeBlack,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        navigateToRoute(context,
                            Routes.trainerPanelSportsman2CreateRoutineWidget,
                            routeArgs:
                                TrainerPanelSportsman2CreateRoutineWidgetArguments(
                                    routine: widget.routine,
                                    service: widget.service));
                      },
                      child: Ink(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                margin: EdgeInsets.zero,
                                color: AppColors.newServiceColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: AppColors.white,
                                        size: 22,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                ln(context, 'create_a_new_schedule'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.white,
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(ln(context, 'history'),
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))),
                  ]),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: widget.history.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RoutineCard(
                      routine: widget.routine,
                      history_child: widget.history[index],
                      service: widget.service,
                    );
                  })
            ]),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}

class RoutineCard extends StatelessWidget {
  TrainerPanelSportsmanResponseModel routine;
  TrainerPanelSportsmanNestedYes history_child;
  TrainerPanelSportsmanNestedNo service;

  RoutineCard({Key key, this.routine, this.history_child, this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        margin: const EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 3,
              offset: const Offset(2, 2))
        ]),
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
                        color: AppColors.greenies,
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
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: AppColors.greenies,
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
                                        FontAwesomeIcons.searchPlus,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // detail to routine
                                        },
                                        child: Text(
                                          ln(context, 'see'),
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
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
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
