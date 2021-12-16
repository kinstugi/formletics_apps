import 'dart:async';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_group.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_nested_exercise.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/sportsman.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/no.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:formletics/common/router/router.gr.dart';

class TrainerPanelSportsman2CreateRoutineWidget extends StatefulWidget {
  final TrainerPanelSportsmanNestedNo service;
  final TrainerPanelSportsmanResponseModel routine;

  const TrainerPanelSportsman2CreateRoutineWidget(
      {Key key, this.service, this.routine})
      : super(key: key);

  @override
  _TrainerPanelSportsman2CreateRoutineWidgetState createState() =>
      _TrainerPanelSportsman2CreateRoutineWidgetState();
}

class _TrainerPanelSportsman2CreateRoutineWidgetState
    extends State<TrainerPanelSportsman2CreateRoutineWidget>
    with TickerProviderStateMixin {
  TrainerPanelSportsmanNestedService _service;
  TrainerPanelSportsmanNestedSportsman _sportsman;

  Map<String, TextEditingController> textEditingControllers4Exercise = {};
  Map<String, TextEditingController> textEditingControllers4Group = {};

  Map<String, TrainerPanelSportsmanNestedExerciseObject> exerciseVal = {};
  Map<String, TrainerPanelSportsmanNestedGroupObject> groupVal = {};
  Map<String, bool> exerciseSuperSets = {};

  TabController tabController;
  String egzersizValue = 'Kayıtlı yazılardan getir';
  String takviyeValue = 'Takviye Seçiniz';
  String ogunValue = 'Öğün';

  TrainerPanelStore _trainerPanelStore = getIt<TrainerPanelStore>();
  FlashHelper _flash;

  @override
  void didChangeDependencies() {
    _flash ??= getIt<FlashHelper>();
    _trainerPanelStore ??= Provider.of<TrainerPanelStore>(context);
    _trainerPanelStore.getAllExercises4TrainerPanel(1);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _sportsman =
        TrainerPanelSportsmanNestedSportsman(id: widget.routine.sportsman);
    _service = TrainerPanelSportsmanNestedService(id: widget.service.id);
    _trainerPanelStore.initRequestModel(_sportsman, _service);
    _trainerPanelStore.getAllExercises4TrainerPanel(1);
    tabController = TabController(length: calculateLen(), vsync: this);
    super.initState();
  }

  int calculateLen() {
    int len = 1;
    if (widget.service.isExercise) {
      len += 1;
    }
    if (widget.service.isNutrition) {
      len += 1;
    }
    if (widget.service.isSupplement) {
      len += 1;
    }
    return len;
  }

  @override
  void dispose() {
    _trainerPanelStore.resetAddRoutine();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: GFAppBar(title: Text(ln(context, 'create_schedule'))),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: <Widget>[
                GFSegmentTabs(
                  height: size.width * 0.09,
                  width: size.width,
                  tabController: tabController,
                  tabBarColor: AppColors.black,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(color: AppColors.purple),
                  indicatorPadding: EdgeInsets.all(8.0),
                  indicatorWeight: 2.0,
                  unselectedLabelStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                  labelStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                  border: Border.all(color: Colors.transparent, width: 1.0),
                  length: calculateLen(),
                  tabs: <Widget>[
                    if (widget.service.isExercise)
                      Text(
                        ln(context, 'exercise'),
                      ),
                    if (widget.service.isNutrition)
                      Text(
                        ln(context, 'nutrition'),
                      ),
                    if (widget.service.isSupplement)
                      Text(
                        ln(context, 'supplementary_food'),
                      ),
                    Text(
                      ln(context, 'general'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GFTabBarView(
                    controller: tabController,
                    height: size.height * 0.72,
                    children: <Widget>[
                      if (widget.service.isExercise)
                        MultiProvider(
                          providers: [
                            Provider<TrainerPanelStore>(
                                create: (_) => _trainerPanelStore),
                          ],
                          child: Observer(
                            builder: (_) {
                              if (_trainerPanelStore.isReadyRequestModel !=
                                      StateStatus.SUCCESS ||
                                  _trainerPanelStore.isSucceedExerciseList !=
                                      StateStatus.SUCCESS) {
                                // if (_trainerPanelStore.isReadyRequestModel !=
                                //     StateStatus.SUCCESS) {
                                return Container(child: Loading());
                              } else {
                                return Container(
                                  child: ListView(
                                    children: <Widget>[
                                      ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 10),
                                          itemCount: _trainerPanelStore
                                              .requestModel.exerciseDays.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            if (_trainerPanelStore.requestModel
                                                .exerciseDays[index].isBreak) {
                                              // Break Day Card
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  right: 3,
                                                  bottom: 3,
                                                ),
                                                height: 80,
                                                decoration:
                                                    BoxDecoration(boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 3,
                                                      spreadRadius: 0,
                                                      offset: Offset(2, 2))
                                                ]),
                                                child: Card(
                                                    color:
                                                        AppColors.darkModeBlack,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      side: BorderSide(
                                                        color: AppColors.white
                                                            .withOpacity(.2),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.zero,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Card(
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      10,
                                                                ),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/svg/muscle.svg',
                                                                  color: Colors
                                                                      .white,
                                                                  height: 22,
                                                                  allowDrawingOutsideViewBox:
                                                                      true,
                                                                ),
                                                              ),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Center(
                                                              child: Text(
                                                                ln(context,
                                                                    'rest_day'),
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Card(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  color: AppColors
                                                                      .deleteColor,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        _trainerPanelStore
                                                                            .removeDay(index);
                                                                      });
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        vertical:
                                                                            5,
                                                                        horizontal:
                                                                            6,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: AppColors
                                                                            .iconColor,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                InkWell(
                                                                  child: Card(
                                                                    margin:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .symmetric(
                                                                        vertical:
                                                                            6,
                                                                        horizontal:
                                                                            6,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: <
                                                                            Widget>[
                                                                          Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                12,
                                                                          ),
                                                                          Text(
                                                                            ln(context,
                                                                                'day'),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                  ),
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _trainerPanelStore
                                                                          .addDay();
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                    5,
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    child: Card(
                                                                      margin: EdgeInsets
                                                                          .zero,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(
                                                                          vertical:
                                                                              6,
                                                                          horizontal:
                                                                              6,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              Icons.add,
                                                                              color: Colors.white,
                                                                              size: 12,
                                                                            ),
                                                                            Text(
                                                                              ln(context, 'break'),
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      color: AppColors
                                                                          .cyanColor,
                                                                    ),
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        _trainerPanelStore
                                                                            .addBreakDay();
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              );
                                              // End Break Day
                                            } else {
                                              return
                                                  // Exercise Days
                                                  Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  side: BorderSide(
                                                    color: AppColors.white
                                                        .withOpacity(.2),
                                                    width: 1,
                                                  ),
                                                ),
                                                color: AppColors.cyanColor
                                                    .withOpacity(0.1),
                                                child: Padding(
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    children: <Widget>[
                                                      SizedBox(height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15),
                                                            child: Text(
                                                              ln(context,
                                                                      'day') +
                                                                  "${_trainerPanelStore.requestModel.exerciseDays[index].number.toString()}",
                                                              style: TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      ListView.separated(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  const SizedBox(
                                                                      height:
                                                                          10),
                                                          itemCount:
                                                              _trainerPanelStore
                                                                  .requestModel
                                                                  .exerciseDays[
                                                                      index]
                                                                  .group
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int j) {
                                                            // Exercise Group

                                                            // Temp Group List
                                                            List<TrainerPanelSportsmanNestedGroupObject>
                                                                groupList = [
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 0,
                                                                  name: ln(
                                                                      context,
                                                                      'choose_a_group')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 6,
                                                                  name: ln(
                                                                      context,
                                                                      'shoulder')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 8,
                                                                  name: ln(
                                                                      context,
                                                                      'back')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 4,
                                                                  name: ln(
                                                                      context,
                                                                      'breast')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 3,
                                                                  name: ln(
                                                                      context,
                                                                      'forearm')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 1,
                                                                  name: ln(
                                                                      context,
                                                                      'triceps')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 7,
                                                                  name: ln(
                                                                      context,
                                                                      'biceps')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 5,
                                                                  name: ln(
                                                                      context,
                                                                      'belly')),
                                                              TrainerPanelSportsmanNestedGroupObject(
                                                                  id: 2,
                                                                  name: ln(
                                                                      context,
                                                                      'leg')),
                                                            ];
                                                            // TextEditingController textEditingController =
                                                            //     TextEditingController(
                                                            //         text: _trainerPanelStore
                                                            //             .requestModel.exerciseDays[index].group[j].name);

                                                            if (_trainerPanelStore
                                                                    .requestModel
                                                                    .exerciseDays[
                                                                        index]
                                                                    .group[j]
                                                                    .group
                                                                    .name !=
                                                                null) {
                                                              var whereIsMy = groupList.where((element) =>
                                                                  element
                                                                      .name ==
                                                                  _trainerPanelStore
                                                                      .requestModel
                                                                      .exerciseDays[
                                                                          index]
                                                                      .group[j]
                                                                      .group
                                                                      .name);
                                                              groupVal[
                                                                      "${index}${j}"] =
                                                                  whereIsMy
                                                                      .last;
                                                            } else {
                                                              groupVal.putIfAbsent(
                                                                  "${index}${j}",
                                                                  () => TrainerPanelSportsmanNestedGroupObject(
                                                                      id: 0,
                                                                      name: ln(
                                                                          context,
                                                                          'choose_a_group')));
                                                            }

                                                            return Card(
                                                              color: AppColors
                                                                  .purple
                                                                  .withOpacity(
                                                                      0.1),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            5)),
                                                                side:
                                                                    BorderSide(
                                                                  color: AppColors
                                                                      .white
                                                                      .withOpacity(
                                                                          .2),
                                                                ),
                                                              ),
                                                              child: ListView(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            10,
                                                                        horizontal:
                                                                            10),
                                                                    child:
                                                                        IntrinsicHeight(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Container(
                                                                              height: size.width * 0.13,
                                                                              child: Card(
                                                                                color: AppColors.searchBoxColor,
                                                                                child: Container(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                                  constraints: BoxConstraints(
                                                                                    maxHeight: size.width * .1,
                                                                                    maxWidth: size.width * .4,
                                                                                  ),
                                                                                  child: DropdownButton<TrainerPanelSportsmanNestedGroupObject>(
                                                                                    // hint: (TrainerPanelSportsmanNestedGroupObject item) {
                                                                                    //   return Row(
                                                                                    //     children: [
                                                                                    //       Text(
                                                                                    //         item.name,
                                                                                    //         textAlign: TextAlign.start,
                                                                                    //       ),
                                                                                    //     ],
                                                                                    //   );
                                                                                    // },
                                                                                    underline: Container(width: 0, height: 0),
                                                                                    value: groupVal["${index}${j}"],
                                                                                    // closeButton: ln(context, 'close'),
                                                                                    // displayClearIcon: false,
                                                                                    hint: Text(ln(context, 'select')),
                                                                                    // searchHint: Text(
                                                                                    //   ln(context, 'select_2'),
                                                                                    // ),
                                                                                    style: TextStyle(fontSize: 9),
                                                                                    onChanged: (value) async {
                                                                                      _trainerPanelStore.changeGroup(index, j, value as TrainerPanelSportsmanNestedGroupObject);
                                                                                      List<TrainerPanelSportsmanNestedExerciseObject> exercises = await _trainerPanelStore.getAllExercises4TrainerPanel(value.id);
                                                                                      _trainerPanelStore.addGroupExercises(index, j, exercises);
                                                                                      setState(() {});
                                                                                    },
                                                                                    items: groupList.map((value0) {
                                                                                      return DropdownMenuItem<TrainerPanelSportsmanNestedGroupObject>(
                                                                                        value: value0,
                                                                                        child: Text(value0.name),
                                                                                      );
                                                                                    }).toList(),
                                                                                    isExpanded: true,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              // TextField(
                                                                              //   onChanged: (value) => _trainerPanelStore
                                                                              //       .changeGroupName(index, j, value),
                                                                              //   controller: textEditingController,
                                                                              //   decoration: InputDecoration(
                                                                              //     hintText: 'Egzersiz Grup İsmi',
                                                                              //     isDense: true,
                                                                              //     hintStyle: TextStyle(
                                                                              //         color: AppColors.white.withOpacity(0.5),
                                                                              //         fontSize: 14),
                                                                              //     fillColor: AppColors.searchBoxColor,
                                                                              //     filled: true,
                                                                              //     enabledBorder: OutlineInputBorder(
                                                                              //       borderRadius: BorderRadius.circular(5),
                                                                              //       borderSide: const BorderSide(
                                                                              //           width: 0, style: BorderStyle.none),
                                                                              //     ),
                                                                              //     focusedBorder: OutlineInputBorder(
                                                                              //       borderRadius: BorderRadius.circular(5),
                                                                              //       borderSide: BorderSide(
                                                                              //           color: AppColors.primaryColor),
                                                                              //     ),
                                                                              //   ),
                                                                              //   style: const TextStyle(color: Colors.white),
                                                                              // ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: <Widget>[
                                                                                Card(
                                                                                  margin: EdgeInsets.zero,
                                                                                  color: AppColors.deleteColor,
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        _trainerPanelStore.removeGroup(index, j);
                                                                                      });
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.symmetric(
                                                                                        vertical: 5,
                                                                                        horizontal: 6,
                                                                                      ),
                                                                                      child: Icon(
                                                                                        Icons.delete,
                                                                                        color: AppColors.iconColor,
                                                                                        size: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(width: 10),
                                                                                Card(
                                                                                  margin: EdgeInsets.zero,
                                                                                  color: AppColors.purple,
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        _trainerPanelStore.addGroup(index);
                                                                                      });
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.symmetric(
                                                                                        vertical: 6,
                                                                                        horizontal: 6,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: <Widget>[
                                                                                          Icon(
                                                                                            Icons.add,
                                                                                            color: Colors.white,
                                                                                            size: 14,
                                                                                          ),
                                                                                          Text(
                                                                                            ln(context, 'group'),
                                                                                            style: TextStyle(
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                            maxWidth:
                                                                                size.width * .5),
                                                                    child: ListView.separated(
                                                                        physics: const NeverScrollableScrollPhysics(),
                                                                        shrinkWrap: true,
                                                                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                                                                        itemCount: _trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList.length,
                                                                        itemBuilder: (BuildContext context, int k) {
                                                                          TextEditingController
                                                                              textEditingControllerSecond =
                                                                              TextEditingController(text: _trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList[k].second);
                                                                          TextEditingController
                                                                              textEditingControllerTimes =
                                                                              TextEditingController(text: _trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList[k].times);
                                                                          if (_trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList[k].exercise !=
                                                                              null) {
                                                                            var whereIsMy = _trainerPanelStore.requestModel.exerciseDays[index].group[j].exercises.where((element) =>
                                                                                element.id ==
                                                                                _trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList[k].exercise.id);
                                                                            exerciseVal["${index}${j}${k}"] =
                                                                                whereIsMy.last;
                                                                          } else {
                                                                            exerciseVal.putIfAbsent("${index}${j}${k}",
                                                                                () => TrainerPanelSportsmanNestedExerciseObject(id: 0, name: ln(context, 'select_2')));
                                                                          }
                                                                          if (_trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList[k].super_set !=
                                                                              null) {
                                                                            exerciseSuperSets["${index}${j}${k}"] =
                                                                                _trainerPanelStore.requestModel.exerciseDays[index].group[j].exerciseList[k].super_set;
                                                                          } else {
                                                                            exerciseSuperSets.putIfAbsent("${index}${j}${k}",
                                                                                () => false);
                                                                          }

                                                                          // Exercises
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 10),
                                                                            child:
                                                                                Card(
                                                                              color: AppColors.searchBoxColor.withOpacity(0.1),
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                side: BorderSide(
                                                                                  color: AppColors.white.withOpacity(.2),
                                                                                  width: 1,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(5),
                                                                                child: Column(
                                                                                  children: <Widget>[
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: <Widget>[
                                                                                        // child: DropdownButton(
                                                                                        //   isExpanded: true,
                                                                                        //   dropdownColor:
                                                                                        //       AppColors.dropdownColor,
                                                                                        //   value: exerciseVal[
                                                                                        //       "${index}${j}${k}"],
                                                                                        //   icon:
                                                                                        //       Icon(Icons.arrow_drop_down),
                                                                                        //   iconSize: 24,
                                                                                        //   elevation: 16,
                                                                                        //   style: TextStyle(
                                                                                        //     fontSize: 10,
                                                                                        //     color: AppColors.white
                                                                                        //         .withOpacity(0.5),
                                                                                        //   ),
                                                                                        //   onChanged:
                                                                                        //       (TrainerPanelAllExerciseList
                                                                                        //           newValue) {
                                                                                        //     setState(() {
                                                                                        //       exerciseVal[
                                                                                        //               "${index}${j}${k}"] =
                                                                                        //           newValue;
                                                                                        //       _trainerPanelStore
                                                                                        //           .changeExercise(index,
                                                                                        //               j, k, newValue.id);
                                                                                        //     });
                                                                                        //   },
                                                                                        //   items: _trainerPanelStore
                                                                                        //       .exerciseList
                                                                                        //       .map((value0) {
                                                                                        //     return DropdownMenuItem<
                                                                                        //         TrainerPanelAllExerciseList>(
                                                                                        //       value: value0,
                                                                                        //       child: Text(value0.name),
                                                                                        //     );
                                                                                        //   }).toList(),
                                                                                        // ),
                                                                                        if (_trainerPanelStore.requestModel.exerciseDays[index].group[j].exercises.isEmpty)
                                                                                          Expanded(
                                                                                              flex: 2,
                                                                                              child: Container(
                                                                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxHeight: size.width * .1,
                                                                                                    maxWidth: size.width * .4,
                                                                                                  ),
                                                                                                  child: Text("Please select group...")))
                                                                                        else
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Card(
                                                                                              color: AppColors.searchBoxColor,
                                                                                              child: SearchableDropdown.single(
                                                                                                selectedValueWidgetFn: (TrainerPanelSportsmanNestedExerciseObject item) {
                                                                                                  return Row(
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        item.name,
                                                                                                        textAlign: TextAlign.start,
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                                underline: Container(width: 0, height: 0),
                                                                                                value: exerciseVal["${index}${j}${k}"],
                                                                                                closeButton: "Kapat",
                                                                                                displayClearIcon: false,
                                                                                                hint: Text(
                                                                                                  ln(context, 'select'),
                                                                                                ),
                                                                                                searchHint: Text(
                                                                                                  ln(context, 'select_2'),
                                                                                                ),
                                                                                                style: TextStyle(fontSize: 9),
                                                                                                onChanged: (val) {
                                                                                                  _trainerPanelStore.changeExercise(index, j, k, val as TrainerPanelSportsmanNestedExerciseObject);
                                                                                                  _showMyDialog(val.media as String);
                                                                                                },
                                                                                                items: _trainerPanelStore.requestModel.exerciseDays[index].group[j].exercises.map((value0) {
                                                                                                  return DropdownMenuItem<TrainerPanelSportsmanNestedExerciseObject>(
                                                                                                    value: value0,
                                                                                                    child: Text(value0.name),
                                                                                                  );
                                                                                                }).toList(),
                                                                                                isExpanded: true,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              Card(
                                                                                                margin: EdgeInsets.zero,
                                                                                                color: AppColors.deleteColor,
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    setState(() {
                                                                                                      _trainerPanelStore.removeExercise(index, j, k);
                                                                                                    });
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                      padding: EdgeInsets.symmetric(
                                                                                                        vertical: 5,
                                                                                                        horizontal: 6,
                                                                                                      ),
                                                                                                      child: Icon(
                                                                                                        Icons.delete,
                                                                                                        color: AppColors.iconColor,
                                                                                                        size: 16,
                                                                                                      )),
                                                                                                ),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Card(
                                                                                                margin: EdgeInsets.zero,
                                                                                                color: AppColors.purple,
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    setState(() {
                                                                                                      _trainerPanelStore.addExercise(index, j, k);
                                                                                                    });
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.symmetric(
                                                                                                      vertical: 6,
                                                                                                      horizontal: 6,
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                      children: <Widget>[
                                                                                                        Icon(
                                                                                                          Icons.add,
                                                                                                          color: Colors.white,
                                                                                                          size: 14,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          ln(context, 'exercise'),
                                                                                                          style: TextStyle(
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
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: <Widget>[
                                                                                        Container(
                                                                                          constraints: BoxConstraints(maxWidth: size.width * .35, maxHeight: size.width * .1),
                                                                                          padding: EdgeInsets.symmetric(horizontal: 3),
                                                                                          child: TextField(
                                                                                            onChanged: (value) => _trainerPanelStore.changeExerciseTimes(index, j, k, value),
                                                                                            controller: textEditingControllerTimes,
                                                                                            decoration: InputDecoration(
                                                                                              hintText: ln(context, 'again'),
                                                                                              isDense: true,
                                                                                              hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 14),
                                                                                              fillColor: AppColors.searchBoxColor,
                                                                                              filled: true,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                                borderSide: BorderSide(width: 1, style: BorderStyle.solid, color: AppColors.primaryColor),
                                                                                              ),
                                                                                            ),
                                                                                            style: TextStyle(color: Colors.white),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          constraints: BoxConstraints(maxWidth: size.width * .35, maxHeight: size.width * .1),
                                                                                          padding: EdgeInsets.symmetric(horizontal: 3),
                                                                                          child: TextField(
                                                                                            onChanged: (value) => _trainerPanelStore.changeExerciseSecond(index, j, k, value),
                                                                                            controller: textEditingControllerSecond,
                                                                                            decoration: InputDecoration(
                                                                                              hintText: 'Süre',
                                                                                              isDense: true,
                                                                                              hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 14),
                                                                                              fillColor: AppColors.searchBoxColor,
                                                                                              filled: true,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                                borderSide: BorderSide(width: 1, style: BorderStyle.solid, color: AppColors.primaryColor),
                                                                                              ),
                                                                                            ),
                                                                                            style: TextStyle(color: Colors.white),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Container(
                                                                                        constraints: BoxConstraints(maxWidth: size.width, maxHeight: size.width * .1),
                                                                                        padding: EdgeInsets.symmetric(horizontal: 3),
                                                                                        child: CheckboxListTile(
                                                                                          title: Text('Super Set', style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 12)),
                                                                                          value: exerciseSuperSets["${index}${j}${k}"],
                                                                                          onChanged: (bool value) {
                                                                                            _trainerPanelStore.changeSuperSet(index, j, k, value);
                                                                                            setState(() {});
                                                                                          },
                                                                                        ))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                          // End Exercises
                                                                        }),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                            // End Exercise Group
                                                          }),
                                                      // Day Actions
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Card(
                                                            margin:
                                                                EdgeInsets.zero,
                                                            color: AppColors
                                                                .deleteColor,
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  _trainerPanelStore
                                                                      .removeDay(
                                                                          index);
                                                                });
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal: 6,
                                                                ),
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: AppColors
                                                                      .iconColor,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          InkWell(
                                                            child: Card(
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical: 6,
                                                                  horizontal: 6,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 12,
                                                                    ),
                                                                    Text(
                                                                      ln(context,
                                                                          'day'),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            onTap: () {
                                                              setState(() {
                                                                _trainerPanelStore
                                                                    .addDay();
                                                              });
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                              5,
                                                            ),
                                                            child: InkWell(
                                                              child: Card(
                                                                margin:
                                                                    EdgeInsets
                                                                        .zero,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 6,
                                                                    horizontal:
                                                                        6,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            12,
                                                                      ),
                                                                      Text(
                                                                        ln(context,
                                                                            'break'),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                color: AppColors
                                                                    .cyanColor,
                                                              ),
                                                              onTap: () {
                                                                setState(() {
                                                                  _trainerPanelStore
                                                                      .addBreakDay();
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                      // End Day Actions
                                                    ],
                                                  ),
                                                  padding: EdgeInsets.all(5),
                                                ),
                                              );
                                              // End Exercise Days
                                            }
                                          }),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      if (widget.service.isNutrition)
                        MultiProvider(
                          providers: [
                            Provider<TrainerPanelStore>(
                                create: (_) => _trainerPanelStore),
                          ],
                          child: Observer(
                            builder: (_) {
                              if (_trainerPanelStore.isReadyRequestModel !=
                                  StateStatus.SUCCESS) {
                                return Loading();
                              } else {
                                TextEditingController
                                    textEditingControllerNutrition =
                                    TextEditingController(
                                        text: _trainerPanelStore
                                            .requestModel?.nutritionList);
                                return Center(
                                  child: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text(ln(context, 'nutrition_list'),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 14)),
                                      ]),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Card(
                                      //     color: AppColors.searchBoxColor,
                                      //     child: Container(
                                      //       padding: EdgeInsets.symmetric(horizontal: 10),
                                      //       constraints: BoxConstraints(
                                      //         maxHeight: size.width * .25,
                                      //       ),
                                      //       child: DropdownButton<String>(
                                      //         isExpanded: true,
                                      //         dropdownColor: AppColors.dropdownColor,
                                      //         value: egzersizValue,
                                      //         icon: Icon(Icons.arrow_drop_down),
                                      //         iconSize: 24,
                                      //         elevation: 16,
                                      //         style: TextStyle(
                                      //           color: AppColors.white.withOpacity(0.5),
                                      //         ),
                                      //         onChanged: (val) {
                                      //           setState(() {
                                      //             egzersizValue = val;
                                      //           });
                                      //         },
                                      //         items: <String>['Kayıtlı yazılardan getir', 'Zürafa', 'Hamsi', 'Maymun']
                                      //             .map<DropdownMenuItem<String>>((String value) {
                                      //           return DropdownMenuItem<String>(
                                      //             value: value,
                                      //             child: Text(value),
                                      //           );
                                      //         }).toList(),
                                      //       ),
                                      //     )),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: TextField(
                                          controller:
                                              textEditingControllerNutrition,
                                          onChanged: (value) {
                                            _trainerPanelStore
                                                .changeNutrition(value);
                                          },
                                          keyboardType: TextInputType.multiline,
                                          minLines: 4,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            hintText:
                                                ln(context, 'add_description'),
                                            isDense: true,
                                            hintStyle: TextStyle(
                                                color: AppColors.white
                                                    .withOpacity(0.5),
                                                fontSize: 14),
                                            fillColor: AppColors.searchBoxColor,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(ln(context, 'or')),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: size.width * .7,
                                                  maxHeight: size.width * .1),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText:
                                                      ln(context, 'select_2'),
                                                  isDense: true,
                                                  hintStyle: TextStyle(
                                                      color: AppColors.white
                                                          .withOpacity(0.5),
                                                      fontSize: 14),
                                                  fillColor:
                                                      AppColors.searchBoxColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        width: 0,
                                                        style:
                                                            BorderStyle.none),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid,
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              child: Card(
                                                margin: EdgeInsets.zero,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 6,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Text(
                                                        ln(context, 'file'),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                color: AppColors.dosyaColor,
                                              ),
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(horizontal: 5),
                                      //   child: Container(
                                      //     constraints: BoxConstraints(maxHeight: size.width * .20, maxWidth: size.width),
                                      //     child: TextField(
                                      //       decoration: InputDecoration(
                                      //         hintText: 'Besin Listesi İsmi',
                                      //         isDense: true,
                                      //         hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 14),
                                      //         fillColor: AppColors.searchBoxColor,
                                      //         filled: true,
                                      //         enabledBorder: OutlineInputBorder(
                                      //           borderRadius: BorderRadius.circular(5),
                                      //           borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                      //         ),
                                      //         focusedBorder: OutlineInputBorder(
                                      //           borderRadius: BorderRadius.circular(5),
                                      //           borderSide: BorderSide(
                                      //               width: 1, style: BorderStyle.solid, color: AppColors.primaryColor),
                                      //         ),
                                      //       ),
                                      //       style: TextStyle(color: Colors.white),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      if (widget.service.isSupplement)
                        Center(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Text(ln(context, 'supplement'),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 14)),
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                                // Card(
                                //   color: AppColors.searchBoxColor,
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(horizontal: 10),
                                //     constraints: BoxConstraints(
                                //       maxHeight: size.width * .25,
                                //     ),
                                //     child: DropdownButton<String>(
                                //       isExpanded: true,
                                //       dropdownColor: AppColors.dropdownColor,
                                //       value: takviyeValue,
                                //       icon: Icon(Icons.arrow_drop_down),
                                //       iconSize: 24,
                                //       elevation: 16,
                                //       style: TextStyle(
                                //         color: AppColors.white.withOpacity(0.5),
                                //       ),
                                //       onChanged: (val) {
                                //         setState(() {
                                //           takviyeValue = val;
                                //         });
                                //       },
                                //       items: <String>['Takviye Seçiniz', 'Zürafa', 'Hamsi', 'Maymun']
                                //           .map<DropdownMenuItem<String>>((String value) {
                                //         return DropdownMenuItem<String>(
                                //           value: value,
                                //           child: Text(value),
                                //         );
                                //       }).toList(),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.all(5),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: <Widget>[
                                //       Container(
                                //         constraints: BoxConstraints(maxWidth: size.width * .40, maxHeight: size.width * .18),
                                //         child: TextField(
                                //           decoration: InputDecoration(
                                //             hintText: 'Porsiyon',
                                //             isDense: true,
                                //             hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 14),
                                //             fillColor: AppColors.searchBoxColor,
                                //             filled: true,
                                //             enabledBorder: OutlineInputBorder(
                                //               borderRadius: BorderRadius.circular(5),
                                //               borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                //             ),
                                //             focusedBorder: OutlineInputBorder(
                                //               borderRadius: BorderRadius.circular(5),
                                //               borderSide: BorderSide(
                                //                   width: 1, style: BorderStyle.solid, color: AppColors.primaryColor),
                                //             ),
                                //           ),
                                //           style: TextStyle(color: Colors.white),
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         width: 10,
                                //       ),
                                //       Card(
                                //         color: AppColors.searchBoxColor,
                                //         child: Container(
                                //           padding: EdgeInsets.symmetric(horizontal: 10),
                                //           constraints:
                                //               BoxConstraints(maxHeight: size.width * .25, maxWidth: size.width * .40),
                                //           child: DropdownButton<String>(
                                //             isExpanded: true,
                                //             dropdownColor: AppColors.dropdownColor,
                                //             value: ogunValue,
                                //             icon: Icon(Icons.arrow_drop_down),
                                //             iconSize: 24,
                                //             elevation: 16,
                                //             style: TextStyle(
                                //               color: AppColors.white.withOpacity(0.5),
                                //             ),
                                //             onChanged: (val) {
                                //               setState(() {
                                //                 ogunValue = val;
                                //               });
                                //             },
                                //             items: <String>['Öğün', 'Zürafa', 'Hamsi', 'Maymun']
                                //                 .map<DropdownMenuItem<String>>((String value) {
                                //               return DropdownMenuItem<String>(
                                //                 value: value,
                                //                 child: Text(value),
                                //               );
                                //             }).toList(),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Text(
                                  ln(context, 'inactive_field'),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      MultiProvider(
                        providers: [
                          Provider<TrainerPanelStore>(
                              create: (_) => _trainerPanelStore),
                        ],
                        child: Observer(
                          builder: (_) {
                            if (_trainerPanelStore.isReadyRequestModel !=
                                StateStatus.SUCCESS) {
                              return Loading();
                            } else {
                              final DateFormat dateFormat =
                                  DateFormat.yMMMd('tr_TR');

                              TextEditingController
                                  textEditingControllerStartDate =
                                  TextEditingController(
                                      text: _trainerPanelStore
                                                  .requestModel.startDate !=
                                              null
                                          ? dateFormat.format(_trainerPanelStore
                                              .requestModel?.startDate)
                                          : null);
                              TextEditingController
                                  textEditingControllerEndDate =
                                  TextEditingController(
                                      text: _trainerPanelStore
                                                  .requestModel.endDate !=
                                              null
                                          ? dateFormat.format(_trainerPanelStore
                                              .requestModel?.endDate)
                                          : null);
                              TextEditingController textEditingControllerNote =
                                  TextEditingController(
                                      text: _trainerPanelStore
                                          .requestModel?.note);
                              return Center(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text(ln(context, 'general'),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 14)),
                                      ]),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: size.width * .40,
                                                  maxHeight: size.width * .20),
                                              child: TextField(
                                                onTap: () {
                                                  var today =
                                                      new DateTime.now();
                                                  DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime: today.add(
                                                          Duration(days: 1)),
                                                      maxTime: today.add(
                                                          Duration(days: 30)),
                                                      onChanged: (date) {
                                                    setState(() {
                                                      _trainerPanelStore
                                                          .changeStartDate(
                                                              date);
                                                    });
                                                    print(
                                                        'change ${_trainerPanelStore.requestModel.startDate.toIso8601String()}');
                                                  }, onConfirm: (date) {
                                                    setState(() {
                                                      _trainerPanelStore
                                                          .changeStartDate(
                                                              date);
                                                    });

                                                    print(
                                                        'confirm ${_trainerPanelStore.requestModel.startDate.toIso8601String()}');
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.tr);
                                                },
                                                controller:
                                                    textEditingControllerStartDate,
                                                decoration: InputDecoration(
                                                  hintText: ln(
                                                      context, 'starting_date'),
                                                  isDense: true,
                                                  hintStyle: TextStyle(
                                                      color: AppColors.white
                                                          .withOpacity(0.5),
                                                      fontSize: 14),
                                                  fillColor:
                                                      AppColors.searchBoxColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        width: 0,
                                                        style:
                                                            BorderStyle.none),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid,
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: size.width * .40,
                                                  maxHeight: size.width * .20),
                                              child: TextField(
                                                onTap: () {
                                                  var today =
                                                      new DateTime.now();
                                                  DatePicker.showDatePicker(context,
                                                      showTitleActions: true,
                                                      minTime: _trainerPanelStore.requestModel.startDate != null
                                                          ? _trainerPanelStore.requestModel.startDate
                                                              .add(const Duration(
                                                                  days: 7))
                                                          : today.add(const Duration(
                                                              days: 7)),
                                                      maxTime: _trainerPanelStore
                                                                  .requestModel
                                                                  .startDate !=
                                                              null
                                                          ? _trainerPanelStore
                                                              .requestModel
                                                              .startDate
                                                              .add(const Duration(days: 30))
                                                          : today.add(const Duration(days: 30)), onChanged: (date) {
                                                    setState(() {
                                                      _trainerPanelStore
                                                          .changeEndDate(date);
                                                    });
                                                    print(
                                                        'change ${_trainerPanelStore.requestModel.startDate.toIso8601String()}');
                                                  }, onConfirm: (date) {
                                                    setState(() {
                                                      _trainerPanelStore
                                                          .changeEndDate(date);
                                                    });

                                                    print(
                                                        'confirm ${_trainerPanelStore.requestModel.startDate.toIso8601String()}');
                                                  }, currentTime: DateTime.now(), locale: LocaleType.tr);
                                                },
                                                controller:
                                                    textEditingControllerEndDate,
                                                decoration: InputDecoration(
                                                  hintText: ln(
                                                      context, 'ending_date'),
                                                  isDense: true,
                                                  hintStyle: TextStyle(
                                                      color: AppColors.white
                                                          .withOpacity(0.5),
                                                      fontSize: 14),
                                                  fillColor:
                                                      AppColors.searchBoxColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        width: 0,
                                                        style:
                                                            BorderStyle.none),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid,
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: TextField(
                                          controller: textEditingControllerNote,
                                          onChanged: (value) {
                                            _trainerPanelStore
                                                .changeNote(value);
                                          },
                                          keyboardType: TextInputType.multiline,
                                          minLines: 4,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            hintText:
                                                ln(context, 'add_description'),
                                            isDense: true,
                                            hintStyle: TextStyle(
                                                color: AppColors.white
                                                    .withOpacity(0.5),
                                                fontSize: 14),
                                            fillColor: AppColors.searchBoxColor,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: RaisedButton(
            onPressed: () async {
              // print(_trainerPanelStore.requestModel.toString());
              await _trainerPanelStore.addRoutine4TrainerPanel();

              if (_trainerPanelStore.isSucceedAddRoutine ==
                  StateStatus.SUCCESS) {
                _flash.informationBar(context,
                    message: ln(context, 'new_schedule_added'));
                navigateToRoute(context, Routes.trainerPanelHomeWidget);
              } else {
                _flash.errorBar(context,
                    message: ln(context, 'fail_add_schedule'));
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(ln(context, 'finish')),
          ),
        ));
  }

  Future<void> _showMyDialog(String media) async {
    CachedVideoPlayerController _controller;

    _controller = CachedVideoPlayerController.network(media);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      _controller.play();
      setState(() {});
    });

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(ln(context, 'preview_of_exercise')),
          content: SingleChildScrollView(
            child: Center(
                child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedVideoPlayer(_controller),
            )),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(ln(context, 'close')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
