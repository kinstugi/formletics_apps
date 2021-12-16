import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/trainer/ui/store/trainer_store.dart';
import 'package:formletics/features/tabs/trainer/ui/widgets/trainer_detail_page_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class TrainerDetailWidget extends StatefulWidget {
  final int trainerId;
  const TrainerDetailWidget({Key key, @required this.trainerId})
      : super(key: key);

  @override
  _TrainerDetailWidgetState createState() => _TrainerDetailWidgetState();
}

class _TrainerDetailWidgetState extends State<TrainerDetailWidget> {
  List<RadioModel> sampleData = <RadioModel>[];
  TrainerStore _trainerStore = getIt<TrainerStore>();
  CachedVideoPlayerController _controller;

  @override
  void didChangeDependencies() {
    _trainerStore.resetDetail();
    _trainerStore ??= Provider.of<TrainerStore>(context);
    _trainerStore.getTrainerDetail(widget.trainerId);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // _trainerStore.resetDetail();
    sampleData.add(RadioModel(true, 2, 30.90));
    sampleData.add(RadioModel(false, 3, 60.90));
    sampleData.add(RadioModel(false, 6, 90.90));
    sampleData.add(RadioModel(false, 12, 120.90));
    super.initState();
  }

  @override
  void dispose() {
    _trainerStore.resetDetail();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          'trainer (#${widget.trainerId}) ',
          // ln(context, 'trainer (#${widget.trainerId}) '), //TODO code here was not working
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),

      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            Provider<TrainerStore>(create: (_) => _trainerStore),
          ],
          child: TrainerDetailPageWidget(
            store: _trainerStore,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}




class RadioItem extends StatelessWidget {
  final RadioModel _item;
  const RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(1),
      color: _item.isSelected
          ? AppColors.greenies
          : AppColors.white.withOpacity(0.15),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₺${_item.price.toString()}",
              style: TextStyle(fontSize: 12, color: AppColors.white),
            ),
            Text(
              ln(context, '${_item.period.toString()} monthly'),
              style: TextStyle(
                fontSize: 8.5,
                color: AppColors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RadioModel {
  bool isSelected;
  int period;
  double price;

  RadioModel(this.isSelected, this.period, this.price);
}
