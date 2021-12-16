import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/models/route_redirect_model.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/app/ui/store/app_store.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/ui/store/auth_methods.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/features/search/ui/pages/search_page.dart';
import 'package:formletics/features/tabs/dashboard/data/data_sources/dummy_data.dart';
//import 'package:formletics/features/tabs/dashboard/data/data_sources/dummy_data.dart';
import 'package:formletics/features/tabs/dashboard/data/models/top_highlights_model.dart';
import 'package:formletics/features/tabs/dashboard/ui/store/dashboard_store.dart';
import 'package:formletics/utils/alerts/alerts.dart';
//import 'package:formletics/widgets/list_item_card/list_item_card.dart';
import 'package:formletics/widgets/searchbar/custom_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  AppStore _appStore;
  Alerts _alerts;
  LoginStore _loginStore;
  final DashBoardStore _dashBoardStore = getIt<DashBoardStore>();



  bool test = false;
  bool _isLoggedIn = false;
  RouteRedirectModel redirectOnLogin = RouteRedirectModel(
    routeName: Routes.homeScreen,
  );
  List<ReactionDisposer> _disposers;

  void doLogin(PostLoginRequestModel param) {
    _loginStore.doLogin(context, param, redirectOnLogin: redirectOnLogin);
  }

  @override
  void dispose() {
    if (_disposers != null) {
      _disposers.map((a) {
        a();
      });
    }
    _dashBoardStore.resetList();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dashBoardStore.resetList();

    _alerts ??= getIt<Alerts>();
    _loginStore ??= Provider.of<LoginStore>(context);
    _appStore ??= Provider.of<AppStore>(context);
    AuthMethods.isAuthenticated().then((value) {
      setState(() {
        _isLoggedIn = value;
      });
    });

    if (_dashBoardStore.isSucceedAllTopHighlights != StateStatus.SUCCESS) {
      _dashBoardStore.getAllTopHighlights();
    }

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: <Widget>[
          if (!_isLoggedIn)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: RaisedButton(
                  color: AppColors.primaryColor,
                  textColor: AppColors.white,
                  onPressed: () {
                    // doLogin(
                    //   const PostLoginRequestModel(
                    //     username: 'sezginbas03',
                    //     password: 'fas5fd465FAfdsa',
                    //   ),
                    // );
                    navigateToRoute(context, Routes.loginScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(ln(context, 'login_or_register')),
                    ],
                  ),
                ),
              ),
            ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: CustomAppBar(typeOfSearch: TypeOfSearch.GeneralSearch),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
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
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: const CachedNetworkImageProvider(
                'https://placeimg.com/640/360/88',
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
                          fontWeight: FontWeight.w600),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(
                  ln(context, 'highlights'),
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
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: DashboardHighlightWidget(_dashBoardStore),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 5),
            child: Row(
              children: [
                Text(
                  "Top Gyms",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 14,
                      ),
                ),
                Flexible(child: Container()),
                Text(
                  "Top Trainers",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 14,
                      ),
                ),
                Flexible(child: Container()),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: DashboardHighlightWidget(_dashBoardStore),
        ),
        // SliverPadding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 15,
        //   ),
        //   // sliver: DashboardHighlightWidget(_dashBoardStore),
        //   sliver: SliverFillRemaining(
        //     child: DashboardHighlightWidget(_dashBoardStore),
        //   ),
        // ),
      ],
    );
  }
}

class DashboardHighlightWidget extends StatelessWidget {
  final DashBoardStore store;

  const DashboardHighlightWidget(this.store);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.isSucceedAllTopHighlights == StateStatus.LOADING) {
          return const Center(child: LinearProgressIndicator());
        }
        if (store.topHighlights?.isEmpty ?? true) {
          print("dummy .......");
          return CustomSideScrollingListWidget(
            highlights: topHighlightsDummyData,
          );
        }
        return CustomSideScrollingListWidget(
          highlights: topHighlightsDummyData,
        );
      },
    );
  }
}

class CustomSideScrollingListWidget extends StatelessWidget {
  const CustomSideScrollingListWidget({Key key, @required this.highlights})
      : super(key: key);

  final List<TopHighlightModel> highlights;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(bottom: 10),
      height: size.width * 0.47 * (2 / 3),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          final model = highlights[i];
          return Container(
            width: size.width * 0.47,
            height: size.width * 0.47 * (2 / 3),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  model.photo ?? 'https://placeimg.com/640/360/54',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 2, top: 2),
                    color: Colors.black.withAlpha(80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(model.subtitle),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
