import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_days_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_service_list.dart';
import 'package:getwidget/getwidget.dart';
import 'package:formletics/common/router/router.gr.dart';

class Routine2RoutineWidget extends StatefulWidget {
  final RoutineServiceListResponseModel routine;
  const Routine2RoutineWidget({Key key, @required this.routine})
      : super(key: key);

  @override
  _Routine2RoutineWidgetState createState() => _Routine2RoutineWidgetState();
}

class _Routine2RoutineWidgetState extends State<Routine2RoutineWidget>
    with TickerProviderStateMixin {
  TabController tabController;
  int length = 0;

  @override
  void initState() {
    length = 0;
    if (widget.routine.service.is_exercise) {
      length = length + 1;
    }
    if (widget.routine.service.is_nutrition) {
      length = length + 1;
    }
    if (widget.routine.service.is_supplement) {
      length = length + 1;
    }
    tabController = TabController(length: length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: GFAppBar(title: Text(ln(context, 'my_schedule'))),
        body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    child: IntrinsicHeight(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 2,
                                child: GFImageOverlay(
                                  image: CachedNetworkImageProvider(
                                    'https://i.pravatar.cc/300?img=${widget.routine.trainer.id}',
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.routine.trainer.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      ln(context, 'personal_trainer'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.zero,
                                      color:
                                          AppColors.greenies.withOpacity(0.2),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Card(
                                              margin: EdgeInsets.zero,
                                              color: AppColors.greenies
                                                  .withOpacity(0.6),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 4,
                                                ),
                                                child: Text(
                                                  widget.routine.trainer
                                                      .sportsman_count
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ln(context, 'student'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.120,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Card(
                                              margin: EdgeInsets.zero,
                                              color: AppColors.purple
                                                  .withOpacity(0.6),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 4,
                                                ),
                                                child: const Text(
                                                  '4,7',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const GFRating(
                                              value: 4.7,
                                              size: 22,
                                            )
                                          ],
                                        ),
                                      ),
                                      color: AppColors.purple.withOpacity(0.2),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GFSegmentTabs(
                      height: size.width * 0.09,
                      width: size.width,
                      tabController: tabController,
                      tabBarColor: AppColors.black,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(color: AppColors.purple),
                      indicatorPadding: EdgeInsets.all(8.0),
                      indicatorWeight: 2.0,
                      labelStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      border: Border.all(color: Colors.transparent, width: 1.0),
                      length: length,
                      tabs: <Widget>[
                        if (widget.routine.service.is_exercise)
                          Text(
                            ln(context, 'exercise'),
                          ),
                        if (widget.routine.service.is_nutrition)
                          Text(
                            ln(context, 'nutrition'),
                          ),
                        if (widget.routine.service.is_supplement)
                          Text(
                            ln(context, 'supplement'),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GFTabBarView(
                        height: size.height * .55,
                        controller: tabController,
                        children: [
                          if (widget.routine.service.is_exercise)
                            ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount: widget.routine.exercise_days.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ExerciseDayWidget(
                                    exercise_day:
                                        widget.routine.exercise_days[index],
                                  );
                                }),
                          if (widget.routine.service.is_nutrition)
                            ListView(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    widget.routine.nutrition_list.text,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.subtitleColor
                                          .withOpacity(.87),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (widget.routine.service.is_supplement)
                            Container(
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 3,
                                      bottom: 3,
                                    ),
                                    height: 100,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                          offset: Offset(2, 2))
                                    ]),
                                    child: Card(
                                      color: AppColors.darkModeBlack,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      margin: EdgeInsets.zero,
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        child: Ink(
                                            child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                left: 10,
                                                top: 10,
                                                child: Container(
                                                  height: 80,
                                                  child: Card(
                                                    margin: EdgeInsets.zero,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 2,
                                                      ),
                                                      child: AspectRatio(
                                                          aspectRatio: 3 / 2,
                                                          child: Container(
                                                            height: 50,
                                                            child:
                                                                Image.network(
                                                              'https://placeimg.com/600/400/121',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )),
                                                    ),
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                )),
                                            Positioned(
                                              left: 150,
                                              top: 14,
                                              child: Text(
                                                ln(context,
                                                    'sample_supplement'),
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Positioned(
                                              left: 150,
                                              top: 34,
                                              child: Text(
                                                ln(context,
                                                    'usage_instruction'),
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        )),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 3,
                                      bottom: 3,
                                    ),
                                    height: 100,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                          offset: Offset(2, 2))
                                    ]),
                                    child: Card(
                                      color: AppColors.darkModeBlack,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      margin: EdgeInsets.zero,
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        child: Ink(
                                            child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                left: 10,
                                                top: 10,
                                                child: Container(
                                                  height: 80,
                                                  child: Card(
                                                    margin: EdgeInsets.zero,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 2,
                                                      ),
                                                      child: AspectRatio(
                                                          aspectRatio: 3 / 2,
                                                          child: Container(
                                                            height: 50,
                                                            child:
                                                                Image.network(
                                                              'https://placeimg.com/600/400/122',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )),
                                                    ),
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                )),
                                            Positioned(
                                              left: 150,
                                              top: 14,
                                              child: Text(
                                                ln(context,
                                                    'sample_supplement'),
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Positioned(
                                              left: 150,
                                              top: 34,
                                              child: Text(
                                                ln(context,
                                                    'usage_instruction'),
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        )),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 3,
                                      bottom: 3,
                                    ),
                                    height: 100,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                          offset: Offset(2, 2))
                                    ]),
                                    child: Card(
                                      color: AppColors.darkModeBlack,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      margin: EdgeInsets.zero,
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        child: Ink(
                                            child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                left: 10,
                                                top: 10,
                                                child: Container(
                                                  height: 80,
                                                  child: Card(
                                                    margin: EdgeInsets.zero,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 2,
                                                      ),
                                                      child: AspectRatio(
                                                          aspectRatio: 3 / 2,
                                                          child: Container(
                                                            height: 50,
                                                            child:
                                                                Image.network(
                                                              'https://placeimg.com/600/400/123',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )),
                                                    ),
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                )),
                                            Positioned(
                                              left: 150,
                                              top: 14,
                                              child: Text(
                                                ln(context,
                                                    'sample_supplement'),
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Positioned(
                                              left: 150,
                                              top: 34,
                                              child: Text(
                                                ln(context,
                                                    'usage_instruction'),
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        )),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class BreakDayWidget extends StatelessWidget {
  const BreakDayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 3,
        bottom: 3,
      ),
      height: 80,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(2, 2))
      ]),
      child: Card(
        color: AppColors.darkModeBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Ink(
              child: Stack(
            children: <Widget>[
              Positioned(
                left: 10,
                top: 24,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/muscle.svg',
                      color: Colors.white,
                      height: 22,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  color: AppColors.primaryColor,
                ),
              ),
              Positioned(
                left: 80,
                top: 37,
                child: Text(
                  ln(context, 'break_day'),
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class ExerciseDayWidget extends StatelessWidget {
  final RoutineExerciseDaysResponseModel exercise_day;
  const ExerciseDayWidget({Key key, this.exercise_day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (exercise_day.is_break) {
      return BreakDayWidget();
    } else {
      return Container(
        margin: EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        height: 80,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 3,
              spreadRadius: 0,
              offset: Offset(2, 2))
        ]),
        child: Card(
          color: AppColors.darkModeBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: EdgeInsets.zero,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Ink(
                child: Stack(
              children: <Widget>[
                Positioned(
                  left: 10,
                  top: 24,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/muscle.svg',
                          color: Colors.white,
                          height: 22,
                          allowDrawingOutsideViewBox: true,
                        )),
                    color: AppColors.primaryColor,
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 37,
                  child: Text(
                    ln(context, '${exercise_day.day_number.toString()}. day'),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )),
            onTap: () {
              // navigate to serviceslist_screen
              navigateToRoute(context, Routes.routine3ExerciseGroupWidget,
                  routeArgs: Routine3ExerciseGroupWidgetArguments(
                      group: exercise_day.group,
                      dayNumber: exercise_day.day_number));
            },
          ),
        ),
      );
    }
  }
}
