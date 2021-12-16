import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/custom_expansion_body.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/custom_expansion_head.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class SportsmanPhotosDetail extends StatefulWidget {
  final int sportsmanId;

  const SportsmanPhotosDetail({this.sportsmanId});

  @override
  _SportsmanPhotosDetailState createState() => _SportsmanPhotosDetailState();
}

class _SportsmanPhotosDetailState extends State<SportsmanPhotosDetail> {
  TrainerPanelStore _store = getIt<TrainerPanelStore>();

  @override
  void initState() {
    if (_store.isSucceedGet4SportsmenProgressPhotos != StateStatus.SUCCESS) {
      _store.fetchProgressPhoto4TrainerPanel(widget.sportsmanId);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _store.resetSportsmen();
    _store ??= Provider.of<TrainerPanelStore>(context);
    if (_store.isSucceedGet4SportsmenProgressPhotos != StateStatus.SUCCESS) {
      _store.fetchProgressPhoto4TrainerPanel(widget.sportsmanId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sportsman Progess'),
      ),
      body: Provider(
        create: (_) => _store,
        child: Observer(
          builder: (ctx) {
            if (_store.isSucceedGet4SportsmenProgressPhotos ==
                StateStatus.LOADING) {
              return Loading();
            }

            return SingleChildScrollView(
              child: Container(
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                      _store.progressPhotos[index].isExpanded = !isExpanded;
                    });
                  },
                  children: _store.progressPhotos.map(
                    (e) {
                      return ExpansionPanel(
                        headerBuilder: (ctx, isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomExpansionHead(
                              bodyFat: e.bodyFat,
                              height: e.height,
                              weight: e.weight,
                            ),
                          );
                        },
                        body: CustomExpansionBody(
                          responseModel: e,
                        ),
                        isExpanded: e.isExpanded,
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
