import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/features/login/ui/store/auth_methods.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/message_tile_widget.dart';
import 'package:formletics/features/tabs/routine/ui/store/routine_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class StudentMessagePage extends StatefulWidget {
  const StudentMessagePage({Key key}) : super(key: key);

  @override
  _StudentMessagePageState createState() => _StudentMessagePageState();
}

class _StudentMessagePageState extends State<StudentMessagePage> {
  final progressKey = GlobalKey();
  RoutineStore _routineStore = getIt<RoutineStore>();
  String _token = "";

  @override
  void didChangeDependencies() {
    _routineStore ??= Provider.of<RoutineStore>(context);
    //_routineStore.resetService();

    if (_routineStore.isSucceedSportsmanChats != StateStatus.SUCCESS) {
      _routineStore.fetchSportsmanTrainersChat();
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
    _routineStore.fetchSportsmanTrainersChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ln(context, 'messages')),
      ),
      body: MultiProvider(
        providers: [
          Provider<RoutineStore>(
            create: (_) => _routineStore,
          ),
        ],
        child: Observer(
          builder: (_) {
            if (_routineStore.isSucceedSportsmanChats == StateStatus.LOADING) {
              return Loading();
            } else {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: _routineStore.sportsmanChats.length,
                itemBuilder: (BuildContext context, int i) {
                  final item = _routineStore.sportsmanChats[i];

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
}
