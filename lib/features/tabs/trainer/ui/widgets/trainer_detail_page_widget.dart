import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/gym/ui/widgets/video_player_widget.dart';
//import 'package:formletics/features/tabs/trainer/ui/pages/students_reference_photo_view.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_detail_service_card.dart';
import 'package:formletics/features/tabs/trainer/ui/store/trainer_store.dart';
import 'package:formletics/features/tabs/trainer/ui/widgets/before_and_after.dart';
import 'package:formletics/features/tabs/trainer/ui/widgets/sportsman_widget.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'custom_badge.dart';
import 'trainer_certificate_widget.dart';

class TrainerDetailPageWidget extends StatelessWidget {
  final TrainerStore store;
  final CachedVideoPlayerController controller;

  const TrainerDetailPageWidget({
    @required this.store,
    @required this.controller
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

    return Observer(
      builder: (_) {
        if (store.isSucceedTrainerDetails == StateStatus.LOADING) {
          return Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Loading(),
          );
        }


        final String videoUrl = store.detailTrainer.introductory_video;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [

              //first element
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: GFImageOverlay(
                            image: CachedNetworkImageProvider(
                              store.detailTrainer.photo ?? 'https://i.imgur.com/ECWiPom.jpg',
                            ),
                            boxFit: BoxFit.cover,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
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
                            Text(
                              store.detailTrainer.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ln(context, 'personal_trainer'),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),

                            // repeating widgets
                            CustomBadge(
                              color: AppColors.greenies,
                              lead: '0',
                              trailing: Text(
                                ln(context, 'student'),
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),

                            // repeating widgets
                            CustomBadge(
                              color: AppColors.purple,
                              lead: '4.7',
                              showSpacer: false,
                              trailing: const GFRating(
                                value: 4.7,
                                size: 22,
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Row(
                children: [
                  Text(
                    ln(context, 'about'),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Container(
                constraints: BoxConstraints(
                    maxHeight: size.width * 0.3, maxWidth: size.width),
                child: Text(
                  store.detailTrainer.statement ??
                      ln(context, 'no_description_yet'),
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

              const SizedBox(height: 10,),

              if (store.detailTrainer.introductory_video != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(ln(context, 'introductory_video'),
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),

              if (store.detailTrainer.introductory_video != null)
                Container(
                  width: size.width,
                  height: size.height * .25,
                  child: CustomVideoPlayerWidget(
                    videoSource: store.detailTrainer.introductory_video
                  ),
                ),
              if (store.detailTrainer.certificates?.isNotEmpty)
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        ln(context,'certificates'), //TODO problem with translation
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white
                        ),
                      ),

                      const Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              if (store.detailTrainer.certificates?.isNotEmpty)
                Container(
                  constraints: BoxConstraints(
                    maxHeight: size.width * .20,
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.detailTrainer.certificates?.length,
                    itemBuilder: (ctx, i) {
                      final cert = store.detailTrainer.certificates[i];

                      return  TrainerCertificateWidget(
                        certName: cert.certName,
                        description: cert.description,
                      );
                    },
                  ),
                ),

              if (store.detailTrainer.students_photo?.isNotEmpty)
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        ln(context,'student_photos'),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white
                        ),
                      ),

                      const Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              if (store.detailTrainer.students_photo?.isNotEmpty)
                Container(
                  constraints: BoxConstraints(
                    maxHeight: size.height * .15,
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.detailTrainer.students_photo?.length,
                    itemBuilder: (ctx, i) {
                      final cert = store.detailTrainer.students_photo[i];

                      return  BeforeAfterImage(
                        beforeImage: cert.beforeImage,
                        afterImage: cert.afterImage,
                      );
                    },
                  ),
                ),

              const SizedBox(height: 10,),

              Row(
                children: <Widget>[
                  Text(
                    ln(context, 'services'),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),

              if (store.detailTrainer.services.isEmpty)
                Container(
                  constraints:
                  BoxConstraints(minHeight: size.width * .2),
                  child: Text(ln(context, 'no_service_yet')),
                ),

              if (store.detailTrainer.services.isNotEmpty)
                Container(
                  constraints:
                  BoxConstraints(minHeight: size.width * .5),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    separatorBuilder: (context, index) => const Divider(),
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: store.detailTrainer.services.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceCardWidget(
                        service: store.detailTrainer.services[index],
                        trainerId: store.detailTrainer.id,
                      );
                    },
                  ),
                ),

              const SizedBox(height: 10),

              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return SportsmanWidget();
                },
              ),

            ],
          ),
        );
      },
    );
  }

}