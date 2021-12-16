import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/programs_page.dart';
import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/students_message_page.dart';
// import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/training_videos_page.dart';
import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/upload_photos_page.dart';
import 'package:formletics/features/tabs/routine/ui/store/routine_store.dart';
import 'package:formletics/features/tabs/routine/ui/widgets/menu_card_grid.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
// import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import 'sub_pages/order_history_page.dart';

class RoutineHomeWidget extends StatefulWidget {
  const RoutineHomeWidget({Key key}) : super(key: key);

  @override
  _RoutineHomeWidgetState createState() => _RoutineHomeWidgetState();
}

class _RoutineHomeWidgetState extends State<RoutineHomeWidget> {
  RoutineStore _routineStore = getIt<RoutineStore>();

  @override
  void didChangeDependencies() {
    _routineStore ??= Provider.of<RoutineStore>(context);
    _routineStore.resetMyTrainers();

    if (_routineStore.isSucceedMyTrainers != StateStatus.SUCCESS) {
      _routineStore.getMyTrainers();
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _routineStore.getMyTrainers();
    super.initState();
  }

  @override
  void dispose() {
    // _routineStore.resetMyTrainers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 5,
            ),
            child: GFImageOverlay(
              height: size.width * .35,
              width: size.width,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.20),
                BlendMode.darken,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: const CachedNetworkImageProvider(
                'https://placeimg.com/640/360/2',
              ),
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ln(context, 'hi'),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ln(context, 'app_suggestion'),
                      style: TextStyle(
                        color: AppColors.subtitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Text(
                  ln(context, 'my_schedule'),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),

        // grid for shit streak
        SliverPadding(
          padding: const EdgeInsets.all(15),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
            children: [
              MenuGridCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const StudentMessagePage(),
                    ),
                  );
                },
                backgroundIcon: FaIcon(
                  FontAwesomeIcons.envelopeOpen,
                  color: AppColors.white,
                  size: 32,
                ),
                bgText: "1",
                color: AppColors.messageColor,
                label: ln(context, 'messages'),
              ),
              MenuGridCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // builder: (ctx) => TrainerVideosPage(),
                      builder: (ctx) => ProgramsPage(),
                    ),
                  );
                },
                backgroundIcon: FaIcon(
                  FontAwesomeIcons.video,
                  color: AppColors.white,
                  size: 32,
                ),
                bgText: "3",
                color: AppColors.onayColor,
                label: ln(context, 'education'),
              ),
              MenuGridCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => UploadPhotosToTrainerPage(),
                    ),
                  );
                },
                backgroundIcon: FaIcon(
                  FontAwesomeIcons.upload,
                  color: AppColors.white,
                  size: 32,
                ),
                bgText: "4",
                color: AppColors.primaryColor,
                label: ln(context, 'upload_photos'),
              ),
              MenuGridCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => OrderHistoryPage(),
                    ),
                  );
                },
                backgroundIcon: FaIcon(
                  FontAwesomeIcons.history,
                  color: AppColors.white,
                  size: 32,
                ),
                bgText: "8",
                color: AppColors.serviceColor,
                label: ln(context, 'order_history'),
              )
            ],
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Text(
                  ln(context, 'your_sizes'),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TrainerCard extends StatelessWidget {
  final TrainerCutResponseModel trainer;
  const _TrainerCard({Key key, this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFImageOverlay(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.20),
        BlendMode.darken,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      image: CachedNetworkImageProvider(
        'https://i.pravatar.cc/300?img=${trainer.id}',
      ),
      child: InkWell(
        splashColor: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () {
          navigateToRoute(
            context,
            Routes.routine1ServicesWidget,
            routeArgs: Routine1ServicesWidgetArguments(trainerId: trainer.id),
          );
        },
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
                    "${trainer.name}",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ln(context, 'sports_hall'),
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
    );
  }
}
