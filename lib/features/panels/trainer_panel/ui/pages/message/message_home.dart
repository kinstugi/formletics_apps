import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/features/login/ui/store/auth_methods.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/message_tile_widget.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class TrainerPanelMessageHomeWidget extends StatefulWidget {
  @override
  _TrainerPanelMessageHomeWidgetState createState() =>
      _TrainerPanelMessageHomeWidgetState();
}

class _TrainerPanelMessageHomeWidgetState
    extends State<TrainerPanelMessageHomeWidget> {
  final progressKey = GlobalKey();
  TrainerPanelStore _trainerPanelStore = getIt<TrainerPanelStore>();
  String _token = "";

  @override
  void didChangeDependencies() {
    _trainerPanelStore ??= Provider.of<TrainerPanelStore>(context);
    _trainerPanelStore.resetServices();

    if (_trainerPanelStore.isSucceedGet4SportsmenChat != StateStatus.SUCCESS) {
      _trainerPanelStore.getSportsmenChat();
    }
    AuthMethods.getAuthToken().then((val) {
      final d = jsonDecode(val);
      setState(() {
        _token = d['token'] as String;
      });
    }).catchError((e) => print(e));
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _trainerPanelStore.getSportsmenChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          ln(context, 'messages'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: MultiProvider(
        providers: [
          Provider<TrainerPanelStore>(
            create: (_) => _trainerPanelStore,
          ),
        ],
        child: Observer(
          builder: (_) {
            if (_trainerPanelStore.isSucceedGet4SportsmenChat ==
                StateStatus.LOADING) {
              return Loading();
            } else {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: _trainerPanelStore.sportsmenChats.length,
                itemBuilder: (BuildContext context, int i) {
                  final item = _trainerPanelStore.sportsmenChats[i];

                  return MessageTileWidget(
                    name: item.user.username,
                    studentId: item.user.id,
                    services: item.service,
                    userToken: _token,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
