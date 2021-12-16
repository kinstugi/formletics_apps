import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/approve/request/change_sportsman.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class TrainerPanelApproveHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainerPanelApproveHomeWidgetState();
}

class _TrainerPanelApproveHomeWidgetState extends SfWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  FlashHelper _flash;

  String filtreValue = 'Tümü';

  TrainerPanelStore _trainerPanelStore = getIt<TrainerPanelStore>();

  @override
  void didChangeDependencies() {
    _flash ??= getIt<FlashHelper>();
    _trainerPanelStore ??= Provider.of<TrainerPanelStore>(context);
    _trainerPanelStore.resetApprove();
    if (_trainerPanelStore.isSucceedGetSportsmen4TrainerPanel !=
        StateStatus.SUCCESS) {
      _trainerPanelStore.getSportsmen4TrainerPanel();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _trainerPanelStore.resetApprove();
    super.dispose();
  }

  void showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
        title: Text(
          ln(context, 'pending_approval'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Wrap(
                    children: [],
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
                    if (_trainerPanelStore.isSucceedGetSportsmen4TrainerPanel ==
                        StateStatus.LOADING) {
                      return Loading();
                    } else {
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: _trainerPanelStore.sportsmen.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Container(
                                constraints:
                                    BoxConstraints(minHeight: size.width * .2),
                                margin: const EdgeInsets.only(
                                  right: 3,
                                  bottom: 3,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.8),
                                      blurRadius: 3,
                                      spreadRadius: 0,
                                      offset: const Offset(2, 2),
                                    )
                                  ],
                                ),
                                child: Card(
                                  color: AppColors.darkModeBlack,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              _trainerPanelStore
                                                  .sportsmen[index]
                                                  .user
                                                  .username,
                                              style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                for (var element
                                                    in _trainerPanelStore
                                                        .sportsmen[index]
                                                        .service)
                                                  Text(
                                                    element.name,
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 3,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .subtitleColor
                                                          .withOpacity(.87),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () async {
                                                void reject() async {
                                                  final TrainerPanelApproveChangeSportsmanRequestModel
                                                      requestStatus =
                                                      TrainerPanelApproveChangeSportsmanRequestModel(
                                                          status: 1,
                                                          id: _trainerPanelStore
                                                              .sportsmen[index]
                                                              .id);

                                                  await _trainerPanelStore
                                                      .putApproveChangeSportsman(
                                                          _trainerPanelStore
                                                              .sportsmen[index]
                                                              .id,
                                                          requestStatus);
                                                  if (_trainerPanelStore
                                                          .statusResponse ==
                                                      1) {
                                                    // showSnackBar("Reddedildi.");
                                                    _flash.informationBar(
                                                        context,
                                                        // message: ln(context, 'denied')
                                                        message: "denied");
                                                    _trainerPanelStore
                                                        .resetStatus();
                                                  }
                                                  await _trainerPanelStore
                                                      .getSportsmen4TrainerPanel();
                                                }

                                                _flash.simpleDialog(context,
                                                    message: ln(context,
                                                        'are_you_sure_deny'),
                                                    title: ln(context,
                                                        'are_you_sure'),
                                                    positiveAction: const Text(
                                                        //TODO changed
                                                        "yes"
                                                        // ln(context, 'yes')
                                                        ),
                                                    negativeAction:
                                                        const Text("no"
                                                            // ln(context, 'no')
                                                            ),
                                                    positiveActionTap: (_) {
                                                  reject();
                                                  _.dismiss();
                                                }, negativeActionTap: (_) {
                                                  _.dismiss();
                                                });
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.times,
                                                color: AppColors.crossColor,
                                                size: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final TrainerPanelApproveChangeSportsmanRequestModel
                                                    requestStatus =
                                                    TrainerPanelApproveChangeSportsmanRequestModel(
                                                        status: 2,
                                                        id: _trainerPanelStore
                                                            .sportsmen[index]
                                                            .id);

                                                await _trainerPanelStore
                                                    .putApproveChangeSportsman(
                                                        _trainerPanelStore
                                                            .sportsmen[index]
                                                            .id,
                                                        requestStatus);
                                                if (_trainerPanelStore
                                                        .statusResponse ==
                                                    2) {
                                                  // showSnackBar("Onaylandı.");
                                                  _flash.informationBar(context,
                                                      message: ln(
                                                          context, 'approved'));
                                                  _trainerPanelStore
                                                      .resetStatus();
                                                }
                                                await _trainerPanelStore
                                                    .getSportsmen4TrainerPanel();
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.check,
                                                color: AppColors.cyanColor,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
