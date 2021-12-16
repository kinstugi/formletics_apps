import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
// import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
// import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/service/service_add.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/service_item_title.dart';
//import 'package:formletics/features/tabs/trainer/data/models/trainer_service_response_model.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class TrainerPanelServiceHomeWidget extends StatefulWidget {
  final String message;
  const TrainerPanelServiceHomeWidget({Key key, this.message})
      : super(key: key);

  @override
  _TrainerPanelServiceHomeWidgetState createState() =>
      _TrainerPanelServiceHomeWidgetState();
}

class _TrainerPanelServiceHomeWidgetState
    extends State<TrainerPanelServiceHomeWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();

  TrainerPanelStore _trainerPanelStore = getIt<TrainerPanelStore>();

  @override
  void didChangeDependencies() {
    _trainerPanelStore ??= Provider.of<TrainerPanelStore>(context);
    _trainerPanelStore.resetServices();

    if (_trainerPanelStore.isSucceedGetServices4TrainerPanel !=
        StateStatus.SUCCESS) {
      _trainerPanelStore.getServices4TrainerPanel();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _trainerPanelStore.getServices4TrainerPanel();
    super.initState();
  }

  @override
  void dispose() {
    //_trainerPanelStore.resetServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
        title: Text(
          ln(context, 'my_services'),
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
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
                      color: AppColors.darkModeBlack,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      margin: EdgeInsets.zero,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          _navigateToNextPage();
                        },
                        child: Ink(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: <Widget>[
                                Card(
                                  margin: EdgeInsets.zero,
                                  color: AppColors.primaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 6,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: AppColors.white,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ln(context, 'add_new_service'),
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
                MultiProvider(
                  providers: [
                    Provider<TrainerPanelStore>(
                      create: (_) => _trainerPanelStore,
                    ),
                  ],
                  child: Observer(
                    builder: (_) {
                      if (_trainerPanelStore
                              .isSucceedGetServices4TrainerPanel ==
                          StateStatus.LOADING) {
                        return Loading();
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: _trainerPanelStore.services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TrainerPanelServiceCard(
                              service: _trainerPanelStore.services[index],
                              store: _trainerPanelStore,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _navigateToNextPage() async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const TrainerPanelServiceAddWidget(),
      ),
    );

    if (res as bool) {
      _trainerPanelStore.getServices4TrainerPanel();
    }
  }
}

class TrainerPanelServiceCard extends StatelessWidget {
  final TrainerPanelStore store;
  final TrainerPanelServiceResponseModel service;

  const TrainerPanelServiceCard({Key key, this.service, this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("item ${service.id}"),
      confirmDismiss: (direction) async {
        final bool res = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: Text('Delete ${service.name} ?'),
            content: Text(ln(context, 'delete_service_msg')),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              )
            ],
          ),
        );
        return res;
      },
      onDismissed: (dxn) {
        store.deleteService(service.id);
      },
      child: ServiceItemLTile(service: service),
    );
  }
}
