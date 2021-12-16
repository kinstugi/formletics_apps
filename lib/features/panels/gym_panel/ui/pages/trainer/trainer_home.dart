import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/request/gym_panel_trainer_request_model.dart';
import 'package:formletics/features/panels/gym_panel/ui/store/gym_panel_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class GymPanelTrainerHomeWidget extends StatefulWidget {
  @override
  _GymPanelTrainerHomeWidgetState createState() =>
      _GymPanelTrainerHomeWidgetState();
}

class _GymPanelTrainerHomeWidgetState extends State<GymPanelTrainerHomeWidget> {
  final progressKey = GlobalKey();
  FlashHelper _flash;
  GymPanelStore _gymPanelStore = getIt<GymPanelStore>();
  final _usernameController = TextEditingController();

  @override
  void didChangeDependencies() {
    _flash ??= getIt<FlashHelper>();
    _gymPanelStore ??= Provider.of<GymPanelStore>(context);
    _gymPanelStore.resetTrainers();

    if (_gymPanelStore.isSucceedGetTrainer != StateStatus.SUCCESS) {
      _gymPanelStore.getTrainers4GymPanel();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    //_gymPanelStore.getTrainers4GymPanel();
    super.initState();
  }

  @override
  void dispose() {
    _gymPanelStore.resetTrainers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
          title: Text(ln(context, 'trainers'),
              textAlign: TextAlign.left, style: TextStyle(fontSize: 14))),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Card(
                          color: Colors.black.withOpacity(0.75),
                          child: Container(
                            height: size.width * 0.1,
                            padding: EdgeInsets.zero,
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                hintText: ln(context, 'select'),
                                isDense: true,
                                hintStyle: TextStyle(
                                    color: AppColors.white.withOpacity(0.5),
                                    fontSize: 14),
                                fillColor: AppColors.searchBoxColor,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child:
                            // constraints: BoxConstraints(
                            //     maxWidth: size.width * .1,
                            //     maxHeight: size.width * .1),
                            Card(
                          child: InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ln(context, 'add'),
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              String usernameController =
                                  _usernameController.text;
                              GymPanelTrainerRequestModel _postContent =
                                  GymPanelTrainerRequestModel(
                                      newTrainer: usernameController);
                              await _gymPanelStore
                                  .addNewTrainer4GymPanel(_postContent);
                              if (_gymPanelStore.isSucceedAddTrainer ==
                                  StateStatus.SUCCESS) {
                                // _flash.informationBar(context,
                                //     message: "Reddedildi.");

                                // _flash.errorBar(context,
                                //     message: "Hata: Eklenemedi.");

                                _flash.successBar(context,
                                    message: ln(context, 'success_message'));

                                await _gymPanelStore.getTrainers4GymPanel();
                              } else {
                                _flash.errorBar(context,
                                    message: ln(context, 'fail_message'));
                              }
                            },
                          ),
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MultiProvider(
                providers: [
                  Provider<GymPanelStore>(create: (_) => _gymPanelStore),
                ],
                child: Observer(
                  builder: (_) {
                    if (_gymPanelStore.isSucceedGetTrainer ==
                        StateStatus.LOADING) {
                      return Loading();
                    } else {
                      if (_gymPanelStore.trainers.isEmpty) {
                        return Center(child: Text(ln(context, 'trainer_fail')));
                      } else {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: _gymPanelStore.trainers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 5,
                                    right: 3,
                                    bottom: 3,
                                  ),
                                  constraints: BoxConstraints(
                                    minHeight: size.width * 0.2,
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
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    margin: EdgeInsets.zero,
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                '${_gymPanelStore.trainers[index].user}',
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${_gymPanelStore.trainers[index].name} ${_gymPanelStore.trainers[index].lastName != null ? _gymPanelStore.trainers[index].lastName : ""}',
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              InkWell(
                                                child: FaIcon(
                                                  FontAwesomeIcons.times,
                                                  color: AppColors.crossColor,
                                                  size: 20,
                                                ),
                                                onTap: () async {
                                                  void remove() async {
                                                    GymPanelTrainerRequestModel
                                                        _removeTrainer =
                                                        GymPanelTrainerRequestModel(
                                                            newTrainer:
                                                                _gymPanelStore
                                                                    .trainers[
                                                                        index]
                                                                    .user);
                                                    await _gymPanelStore
                                                        .removeTrainer4GymPanel(
                                                            _removeTrainer);

                                                    if (_gymPanelStore
                                                            .isSucceedRemoveTrainer ==
                                                        StateStatus.SUCCESS) {
                                                      _flash.informationBar(
                                                          context,
                                                          message: ln(context,
                                                              'removed'));
                                                      await _gymPanelStore
                                                          .getTrainers4GymPanel();
                                                    } else {
                                                      _flash.errorBar(context,
                                                          message: ln(context,
                                                              'remove_fail_message'));
                                                    }
                                                  }

                                                  _flash.simpleDialog(context,
                                                      message: ln(context,
                                                          'delete_ensure'),
                                                      title: ln(context,
                                                          'are_you_sure'),
                                                      positiveAction: Text(
                                                          ln(context, 'yes')),
                                                      negativeAction: Text(
                                                          ln(context, 'no')),
                                                      positiveActionTap: (_) {
                                                    remove();
                                                    _.dismiss();
                                                  }, negativeActionTap: (_) {
                                                    _.dismiss();
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                width: 25,
                                              )
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
