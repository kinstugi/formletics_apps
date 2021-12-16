import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_group_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_list_model.dart';
import 'package:getwidget/getwidget.dart';
import 'package:formletics/common/router/router.gr.dart';

class Routine3ExerciseGroupWidget extends StatefulWidget {
  final List<RoutineExerciseGroupResponseModel> group;
  final int dayNumber;

  const Routine3ExerciseGroupWidget(
      {Key key, @required this.group, @required this.dayNumber})
      : super(key: key);

  @override
  _Routine3ExerciseGroupWidgetState createState() =>
      _Routine3ExerciseGroupWidgetState();
}

class _Routine3ExerciseGroupWidgetState
    extends State<Routine3ExerciseGroupWidget> {
  final _emailController = TextEditingController();
  final progressKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          ln(context, '${widget.dayNumber.toString()}. day'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: widget.group.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExerciseGroupTitleWidget(
                      group: widget.group[index],
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}

class ExerciseListWidget extends StatelessWidget {
  final RoutineExerciseListResponseModel exercise;
  const ExerciseListWidget({Key key, this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        margin: EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 3,
              spreadRadius: 0,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Card(
          color: AppColors.darkModeBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: EdgeInsets.zero,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            onTap: () {
              // Navigate to playground_screen
              navigateToRoute(
                context,
                Routes.routine4ExerciseDetailWidget,
                routeArgs:
                    Routine4ExerciseDetailWidgetArguments(exercise: exercise),
              );
            },
            child: Ink(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.zero,
                    color: AppColors.primaryColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Icon(
                        Icons.alarm,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: size.width * 0.3,
                        maxWidth: size.width * 0.4),
                    child: Text(
                      exercise.name,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.subtitleColor.withOpacity(.87),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.flash_on,
                        size: 26,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        ln(context, 'start_work'),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class ExerciseGroupTitleWidget extends StatelessWidget {
  final RoutineExerciseGroupResponseModel group;
  const ExerciseGroupTitleWidget({Key key, this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: Text(
                group.name,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: group.exercise_list.length,
          itemBuilder: (BuildContext context, int index) {
            return ExerciseListWidget(
              exercise: group.exercise_list[index],
            );
          },
        )
      ],
    );
  }
}
