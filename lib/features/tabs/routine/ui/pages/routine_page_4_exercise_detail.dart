import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_list_model.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:screen/screen.dart';

class Routine4ExerciseDetailWidget extends StatefulWidget {
  final RoutineExerciseListResponseModel exercise;

  const Routine4ExerciseDetailWidget({Key key, @required this.exercise})
      : super(key: key);

  @override
  _Routine4ExerciseDetailWidgetState createState() =>
      _Routine4ExerciseDetailWidgetState();
}

class _Routine4ExerciseDetailWidgetState
    extends State<Routine4ExerciseDetailWidget> {
  final progressKey = GlobalKey();
  CachedVideoPlayerController _controller;
  final _isHours = true;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    isLapHours: true,
  );
  //final _scrollController = ScrollController();

  @override
  void initState() {
    print("https://www.formletics.com{$widget.exercise.media}");
    _controller = CachedVideoPlayerController.network(
        "https://www.formletics.com${widget.exercise.media}");
    _controller.initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
      _controller.play();
    });
    Screen.keepOn(true);
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(ln(context, 'trainers_note')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(ln(context, 'sample_text')),
                Text(
                    "Bazı balıkların yumurtaları özel bir yiyecek olarak ayrıca değerlidir. Bunlar özellikle Hazar Denizi'nde yaşayan mersin balığından ve bir mersin balığı türü olan çirozdan elde edilen yumurtalardır. Bunlar içinde siyah havyar en değerlisidir. Mersin ve çiroz balıkları canlı olarak yakalanır, içlerinden yumurtaları çıkarılır ve karınları dikilerek tekrar suya bırakılır. Bu şekilde, bir balıktan 3-4 kez havyar elde edilebilir. Tuzlanıp kutulanan havyarlar yüksek fiyattan bütün Dünya'ya satılır. Siyah havyarın en makbul ve pahalı cinsi beluga havyarıdır. Somondan elde edilen kırmızı havyar ise siyahı kadar değerli değildir."),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(ln(context, 'sample_text_2')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          "${widget.exercise.name} ${widget.exercise.times}/${widget.exercise.second}",
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: RaisedButton(
                color: AppColors.primaryColor,
                textColor: AppColors.white,
                onPressed: () {
                  _showMyDialog();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(ln(context, 'trainers_note')),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  right: 3,
                  bottom: 3,
                ),
                /* decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 3,
                      spreadRadius: 0,
                      offset: Offset(2, 2))
                ]), */
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: AppColors.cardWhite.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              "Set: ${widget.exercise.second}",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: AppColors.darkModeBlack,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          margin: EdgeInsets.zero,
                          child: Icon(
                            Icons.alarm,
                            color: AppColors.primaryColor,
                            size: 28,
                          ),
                        ),
                        Card(
                          color: AppColors.cardWhite.withOpacity(0.4),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              ln(context, 'repeat: ${widget.exercise.times}'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Display stop watch time
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: StreamBuilder<int>(
                        stream: _stopWatchTimer.rawTime,
                        initialData: _stopWatchTimer.rawTime.value,
                        builder: (context, snap) {
                          final value = snap.data;
                          final displayTime = StopWatchTimer.getDisplayTime(
                              value,
                              hours: _isHours);
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  displayTime,
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: _controller.value != null &&
                              _controller.value.initialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: CachedVideoPlayer(_controller),
                            )
                          : Center(
                              child: Loading(),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: // Button
                Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            child: RaisedButton(
                              padding: const EdgeInsets.all(4),
                              color: AppColors.greenies,
                              shape: const StadiumBorder(),
                              onPressed: () async {
                                _stopWatchTimer.onExecute
                                    .add(StopWatchExecute.start);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.play,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: AppColors.primaryColor,
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.stop);
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.pause,
                              size: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: AppColors.crossColor,
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.reset);
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.redo,
                              size: 14,
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Center(
                    child: Text(
                      "${widget.exercise.name} ${widget.exercise.times}/${widget.exercise.second}",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    _stopWatchTimer.dispose();
    Screen.keepOn(false);
  }
}
