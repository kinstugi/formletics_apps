import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/gym/ui/pages/send_offer_to_gym.dart';
import 'package:formletics/features/tabs/gym/ui/store/gym_store.dart';
import 'package:formletics/features/tabs/gym/ui/widgets/video_player_widget.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class GymDetailWidget extends StatefulWidget {
  final int gymId;
  const GymDetailWidget({Key key, this.gymId}) : super(key: key);

  @override
  _GymDetailWidgetState createState() => _GymDetailWidgetState();
}

class _GymDetailWidgetState extends State<GymDetailWidget> {
  GymStore _gymStore = getIt<GymStore>();

  @override
  void didChangeDependencies() {
    int gymId = widget.gymId ?? 94;

    _gymStore.resetDetail();
    _gymStore ??= Provider.of<GymStore>(context);
    _gymStore.getGymDetail(gymId);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _gymStore.resetDetail();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
          title: Text(
              //'gym',
              ln(context, 'gym'),
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 14))),
      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            Provider<GymStore>(create: (_) => _gymStore),
          ],
          child: SubWidget(
            gymStore: _gymStore,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SendOfferToGym()),
            );
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(ln(context, 'ask_offer')),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  final GymStore gymStore;

  const SubWidget({@required this.gymStore});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) {
        if (gymStore.isSucceedGymDetails == StateStatus.LOADING) {
          return Loading();
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                              image: CachedNetworkImageProvider(
                                '${gymStore.detailGym.photo}',
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(gymStore.detailGym.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Text(ln(context, 'sport_halls'),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              Card(
                                margin: EdgeInsets.zero,
                                color: AppColors.greenies.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color:
                                            AppColors.greenies.withOpacity(0.6),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 4,
                                          ),
                                          child: Text(
                                            gymStore.detailGym.id.toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ln(context, 'student'),
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.120,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.zero,
                                color: AppColors.purple.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color:
                                            AppColors.purple.withOpacity(0.6),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 4,
                                          ),
                                          child: Text(
                                            '4,7',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const GFRating(
                                        value: 4.7,
                                        size: 22,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        ln(context, 'description'),
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: size.width * 0.3, maxWidth: size.width),
                  child: Text(
                    gymStore.detailGym.statement != null &&
                            gymStore.detailGym.statement != ""
                        ? gymStore.detailGym.statement
                        : ln(context, 'no_description'),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.fade,
                    maxLines: 6,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.subtitleColor.withOpacity(.87),
                    ),
                  ),
                ),
                if (gymStore.detailGym.introductory_video != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          ln(context, 'introductory_video'),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (gymStore.detailGym.introductory_video != null)
                  Container(
                    width: double.infinity,
                    height: size.height * .25,
                    child: CustomVideoPlayerWidget(
                      videoSource: gymStore.detailGym.introductory_video,
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
                        ln(context, 'images'),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: size.width * .35,
                  ),
                  child: ListView.builder(
                    itemCount: gymStore.detailGym.images.length ?? 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      bool _usePlaceholder = false;
                      if (gymStore.detailGym.images == null ||
                          gymStore.detailGym.images.isEmpty) {
                        _usePlaceholder = true;
                      }

                      final image = gymStore.detailGym?.images[i];
                      const String _placeHolder = "https://cutt.ly/EcO8c0G";

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: GFImageOverlay(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                image: NetworkImage(_usePlaceholder
                                    ? _placeHolder
                                    : image.image),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        ln(context, 'trainers'),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                if (gymStore.detailGym.trainers.isEmpty)
                  Container(
                    constraints: BoxConstraints(minHeight: size.width * .2),
                    child: Text(ln(context, 'no_trainer')),
                  ),
                if (gymStore.detailGym.trainers.isNotEmpty)
                  Container(
                    constraints: BoxConstraints(maxHeight: size.width * .25),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: gymStore.detailGym.trainers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _TrainerCard(
                              trainer: gymStore.detailGym.trainers[index],
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}

class _TrainerCard extends StatelessWidget {
  final TrainerCutResponseModel trainer;
  const _TrainerCard({Key key, this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = trainer?.photo;

    return InkWell(
      onTap: () {
        navigateToRoute(context, Routes.trainerDetailWidget);
      },
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: GFImageOverlay(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.20), BlendMode.darken),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxFit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            image ?? 'https://i.imgur.com/ECWiPom.jpg',
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.verified_user,
                        size: 16,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.verified_user,
                        size: 16,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainer.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ln(context, 'personal_trainer'),
                      style: TextStyle(
                        color: AppColors.subtitleColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
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
  }
}
