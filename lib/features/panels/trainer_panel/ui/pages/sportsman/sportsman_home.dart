import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/routine_card.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class TrainerPanelSportsmanHomeWidget extends StatefulWidget {
  @override
  _TrainerPanelSportsmanHomeWidgetState createState() =>
      _TrainerPanelSportsmanHomeWidgetState();
}

class _TrainerPanelSportsmanHomeWidgetState
    extends State<TrainerPanelSportsmanHomeWidget> {
  final progressKey = GlobalKey();
  String filtreValue = 'Tümü';

  FlashHelper _flash;
  TrainerPanelStore _trainerPanelStore = getIt<TrainerPanelStore>();

  @override
  void didChangeDependencies() {
    _flash ??= getIt<FlashHelper>();

    _trainerPanelStore ??= Provider.of<TrainerPanelStore>(context);
    _trainerPanelStore.resetSportsmen();
    if (_trainerPanelStore.isSucceedGetNeedRoutine != StateStatus.SUCCESS) {
      _trainerPanelStore.getNeedRoutines4TrainePanel();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    if (_trainerPanelStore.isSucceedGetNeedRoutine != StateStatus.SUCCESS) {
      _trainerPanelStore.getNeedRoutines4TrainePanel();
    }
    super.initState();
  }

  @override
  void dispose() {
    _trainerPanelStore.resetSportsmen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          ln(context, 'service_purchasers'),
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
                    children: [
                      DropdownButton<String>(
                        isExpanded: false,
                        dropdownColor: AppColors.dropdownColor,
                        value: filtreValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String newValue) {
                          setState(() {
                            filtreValue = newValue;
                          });
                        },
                        items: <String>['Tümü', 'Zürafa', 'Hamsi', 'Maymun']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
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
                    if (_trainerPanelStore.isSucceedGetNeedRoutine ==
                        StateStatus.LOADING) {
                      return Loading();
                    } else {
                      if (_trainerPanelStore.needRoutine.isEmpty) {
                        return Center(
                          child: Text(ln(context, 'no_schedule_found')),
                        );
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: _trainerPanelStore.needRoutine.length,
                          itemBuilder: (BuildContext context, int i) {
                            if (_trainerPanelStore
                                .needRoutine[i].no.isNotEmpty) {
                              return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount:
                                    _trainerPanelStore.needRoutine[i].no.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print("<><><><><><><><><><><><>");
                                  print(_trainerPanelStore
                                      .needRoutine[i].no[index].name);
                                  return RoutineCard(
                                    routine: _trainerPanelStore.needRoutine[i],
                                    service: _trainerPanelStore
                                        .needRoutine[i].no[index],
                                    history:
                                        _trainerPanelStore.needRoutine[i].yes,
                                  );
                                },
                              );
                            } else {
                              return Container(
                                width: 0,
                                height: 0,
                              );
                            }
                          },
                        );
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
