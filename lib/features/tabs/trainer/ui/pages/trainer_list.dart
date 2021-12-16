import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:formletics/features/tabs/trainer/ui/store/trainer_store.dart';
import 'package:formletics/widgets/list_item_card/list_item_card.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loadany/loadany_widget.dart';
import 'package:provider/provider.dart';

class TrainerListWidget extends StatefulWidget {
  @override
  _TrainerListWidgetState createState() => _TrainerListWidgetState();
}

class _TrainerListWidgetState extends State<TrainerListWidget> {
  final progressKey = GlobalKey();
  LoadStatus status = LoadStatus.normal;

  TrainerStore _trainerStore = getIt<TrainerStore>();

  @override
  void didChangeDependencies() {
    _trainerStore.resetList();
    _trainerStore ??= Provider.of<TrainerStore>(context);

    if (_trainerStore.isSucceedAllTrainers != StateStatus.SUCCESS) {
      _trainerStore.getAllTrainers();
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _trainerStore.resetList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: GFAppBar(
          title: Text(ln(context, 'all_trainers'),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14)
          )
      ),
      body: LoadAny(
        loadingMsg: ln(context, 'loading'),
        errorMsg: ln(context, 'error_message'),
        finishMsg: ln(context, 'finish'),
        status: status,
        footerHeight: 100,
        onLoadMore: getLoadMore,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: SizedBox(
                  height: 50,
                  child: Card(
                    color: AppColors.searchBoxColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      onTap: () {},
                      child: Ink(
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 10,
                              top: 14,
                              child: Icon(
                                Icons.search,
                                size: 22,
                                color: AppColors.white,
                              ),
                            ),
                            Positioned(
                              left: 50,
                              top: 19,
                              child: Text(
                                ln(context, 'search'),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 14,
                              child: Icon(
                                Icons.filter_list,
                                size: 22,
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
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
                child: Text(ln(context, 'suggestion_message'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14))),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              sliver: MultiProvider(
                providers: [
                  Provider<TrainerStore>(create: (_) => _trainerStore),
                ],
                child: Observer(builder: (_) {
                  if (_trainerStore.count == 0) {
                    return SliverToBoxAdapter(child: Loading());
                  } else {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          TrainerCutResponseModel trainer =
                            _trainerStore?.allTrainers?.results[index];
                          return ListItemCard(
                            padding: const EdgeInsets.all(0),
                            title: trainer.name,
                            aspectRatio: 1,
                            photoUrl: trainer.photo?? "https://cutt.ly/PkmoE9e",
                            subtitle: "Personal Trainer",
                            topLeftIcon: Icon(
                              Icons.verified_user,
                              size: 16,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            topRightIcon: Icon(
                              Icons.verified_user,
                              size: 16,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            onTap: (){
                              navigateToRoute(context, Routes.trainerDetailWidget,
                                  routeArgs: TrainerDetailWidgetArguments(trainerId: trainer.id));
                            },
                          );
                        },
                        childCount:
                            _trainerStore?.count != 0 ? _trainerStore.count : 2,
                      ),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getLoadMore() async {
    setState(() {
      status = LoadStatus.loading;
    });
    await _trainerStore.getAllTrainerByPage(_trainerStore.pageLink);
    status = LoadStatus.normal;
    if (_trainerStore.pageLink == null) {
      status = LoadStatus.completed;
    }
    setState(() {});
  }
}

