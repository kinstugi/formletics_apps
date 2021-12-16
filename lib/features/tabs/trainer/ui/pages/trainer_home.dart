import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/search/ui/pages/search_page.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_detail.dart';
import 'package:formletics/features/tabs/trainer/ui/store/trainer_store.dart';
import 'package:formletics/widgets/list_item_card/list_view_title.dart';
import 'package:formletics/widgets/searchbar/custom_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import "../../../../../widgets/list_item_card/list_item_card.dart";

class TrainerHomeWidget extends StatefulWidget {
  const TrainerHomeWidget({Key key}) : super(key: key);

  @override
  _TrainerHomeWidgetState createState() => _TrainerHomeWidgetState();
}

class _TrainerHomeWidgetState extends State<TrainerHomeWidget> {
  TrainerStore _trainerStore = getIt<TrainerStore>();

  final List<String> imageList = [
    "https://placeimg.com/640/360/71",
    "https://placeimg.com/640/360/72",
    "https://placeimg.com/640/360/73",
    "https://placeimg.com/640/360/74",
    "https://placeimg.com/640/360/75",
    "https://placeimg.com/640/360/76",
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _trainerStore.resetList();
    _trainerStore ??= Provider.of<TrainerStore>(context);

    if (_trainerStore.isSucceedAllFeaturedTrainers != StateStatus.SUCCESS) {
      _trainerStore.getAllFeaturedTrainers();
    }

    if (_trainerStore.isSucceedAllTrainersHighlight != StateStatus.SUCCESS) {
      _trainerStore.getAllTrainersHighlight();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          children: <Widget>[
            const CustomAppBar(typeOfSearch: TypeOfSearch.TrainerSearch,),
            const SizedBox(
              height: 10,
            ),
            GFCarousel(
              aspectRatio: 16 / 9,
              autoPlay: true,
              pagination: true,
              items: imageList.map(
                (url) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: GFImageOverlay(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.20), BlendMode.darken),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: CachedNetworkImageProvider(url),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ln(context, 'be_the_strongest'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'visit_trainers'),
                                    style: TextStyle(
                                      color: AppColors.subtitleColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                // setState(() {
                //   index;
                // });
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    ln(context, 'categories'),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 14,
                ),
              ],
            ),

            Container(
              constraints: BoxConstraints(
                maxHeight: size.width * .10,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (ctx,i){
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: RaisedButton(
                      color: Colors.grey,
                      textColor: AppColors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: const EdgeInsets.all(5.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {},
                      child: Text(
                        ln(context, 'recommended'),
                      ),
                    ),
                  );
                },
              ),
            ),

            ListViewTitle(
              title: 'Trainers',
              onTap: () {
                navigateToRoute(context, Routes.trainerListWidget);
              },
            ),

            //trainer list
            Container(
              constraints: BoxConstraints(
                maxHeight: size.width * .25,
              ),
              child: TrainersListWidget(
                store: _trainerStore,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    ln(context, 'highlights'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 14,
                )
              ],
            ),

            //highlights list
            Container(
              constraints: BoxConstraints(
                maxHeight: size.width * .25,
              ),
              child: TrainersListWidget(
                store: _trainerStore,
                isHighlight: true,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}



class TrainersListWidget extends StatelessWidget {
  final TrainerStore store;
  final bool isHighlight;

  TrainersListWidget({@required this.store, this.isHighlight = false});

  final List<String> imageList = [
    "https://placeimg.com/640/360/71",
    "https://placeimg.com/640/360/72",
    "https://placeimg.com/640/360/73",
    "https://placeimg.com/640/360/74",
    "https://placeimg.com/640/360/75",
    "https://placeimg.com/640/360/76",
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<TrainerListCardModel> _trainers = [];
        if (!isHighlight) {
          if (store.isSucceedAllFeaturedTrainers == StateStatus.LOADING) {
            return const Center(child: LinearProgressIndicator());
          }
          _trainers = store.allFeaturedTrainers;
        } else {
          if (store.isSucceedAllTrainersHighlight == StateStatus.LOADING) {
            return const Center(child: LinearProgressIndicator());
          }
          _trainers = store.allTrainersHighlight;
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _trainers.length,
          itemBuilder: (context, index) {
            final rand = Random();
            final int _placeholderImageIndex = rand.nextInt(5);

            final String _photoUrl =
                _trainers[index].photo ?? imageList[_placeholderImageIndex];

            return ListItemCard(
              title: _trainers[index].name,
              aspectRatio: 3 / 2,
              photoUrl: _photoUrl,
              topLeftIcon: Icon(Icons.verified_user,
                  size: 16, color: Colors.white.withOpacity(0.8)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => TrainerDetailWidget(
                      trainerId: _trainers[index].id,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
