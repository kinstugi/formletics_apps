import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/request/gym_panel_manager_request_model.dart';
import 'package:formletics/features/panels/gym_panel/ui/store/gym_panel_store.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class GymPanelManagerHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GymPanelManagerHomeWidgetState();
}

class _GymPanelManagerHomeWidgetState extends SfWidget {
  final progressKey = GlobalKey();
  final _usernameController = TextEditingController();
  FlashHelper _flash;
  GymPanelStore _gymPanelStore = getIt<GymPanelStore>();

  @override
  void didChangeDependencies() {
    _flash ??= getIt<FlashHelper>();
    _gymPanelStore ??= Provider.of<GymPanelStore>(context);
    _gymPanelStore.resetManagers();

    if (_gymPanelStore.isSucceedGetManager != StateStatus.SUCCESS) {
      _gymPanelStore.getManagers4GymPanel();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _gymPanelStore.resetManagers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
          title: Text(ln(context, 'executives'),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14),
          )
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10
                ),
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
                                  borderSide: const BorderSide(
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
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: AppColors.primaryColor,
                          child: InkWell(
                            onTap: () async {
                              String usernameController =
                                  _usernameController.text;
                              GymPanelManagerRequestModel _postContent =
                                  GymPanelManagerRequestModel(
                                      newManager: usernameController);
                              await _gymPanelStore
                                  .addNewManager4GymPanel(_postContent);
                              if (_gymPanelStore.isSucceedAddTrainer ==
                                  StateStatus.SUCCESS) {
                                _flash.successBar(context,
                                    message: ln(context, 'success_message'));
                                await _gymPanelStore.getManagers4GymPanel();
                              } else {
                                _flash.errorBar(context,
                                    message: ln(context, 'fail_message'));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
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
                                    ln(context, 'add'),
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
                ),
              ),
              MultiProvider(
                providers: [
                  Provider<GymPanelStore>(create: (_) => _gymPanelStore),
                ],
                child: Observer(builder: (_) {
                  if (_gymPanelStore.isSucceedGetManager ==
                      StateStatus.LOADING) {
                    return Loading();
                  } else {
                    return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: _gymPanelStore.managers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Container(
                              margin: const EdgeInsets.only(
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
                                    offset: const Offset(2, 2))
                              ]),
                              child: Card(
                                color: AppColors.darkModeBlack,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                            _gymPanelStore.managers[index],
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () async {
                                              void remove() async {
                                                GymPanelManagerRequestModel
                                                    removeManager =
                                                    GymPanelManagerRequestModel(
                                                        newManager:
                                                            _gymPanelStore
                                                                    .managers[
                                                                index]);
                                                await _gymPanelStore
                                                    .removeManager4GymPanel(
                                                        removeManager);

                                                if (_gymPanelStore
                                                        .isSucceedRemoveManager ==
                                                    StateStatus.SUCCESS) {
                                                  _flash.informationBar(context,
                                                      message: ln(
                                                          context, 'removed'));
                                                  await _gymPanelStore
                                                      .getManagers4GymPanel();
                                                } else {
                                                  _flash.errorBar(context,
                                                      message: ln(context,
                                                          'remove_fail_message'));
                                                }
                                              }

                                              _flash.simpleDialog(context,
                                                  message: ln(
                                                      context, 'delete_ensure'),
                                                  title: ln(
                                                      context, 'are_you_sure'),
                                                  positiveAction:
                                                      Text(ln(context, 'yes')),
                                                  negativeAction:
                                                      Text(ln(context, 'no')),
                                                  positiveActionTap: (_) {
                                                remove();
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
                }),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
