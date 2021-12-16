import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_cut_reponse_model.dart';
import 'package:formletics/features/tabs/gym/ui/store/gym_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loadany/loadany_widget.dart';
import 'package:provider/provider.dart';
import 'package:formletics/features/location/ui/store/location_store.dart';

class GymListWidget extends StatefulWidget {
  @override
  _GymListWidgetState createState() => _GymListWidgetState();
}

class _GymListWidgetState extends State<GymListWidget> {
  final progressKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LoadStatus status = LoadStatus.normal;

  GymStore _gymStore = getIt<GymStore>();
  LocationStore _locStore = getIt<LocationStore>();

  @override
  void didChangeDependencies() {
    _gymStore.resetList();
    _gymStore ??= Provider.of<GymStore>(context);
    _locStore ??= Provider.of<LocationStore>(context);

    if (_gymStore.isSucceedAllGyms != StateStatus.SUCCESS) {
      _gymStore.getAllGyms();
    }

    if (_locStore.isSucceedIl != StateStatus.SUCCESS) {
      _locStore.getIl();
    }

    super.didChangeDependencies();
  }

  String layout = 'grid';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _gymStore.resetList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: GFDrawer(
        color: AppColors.darkModeBlack,
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Filtrele",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  MaterialButton(
                    onPressed: () {
                      print("Filtrele");
                    },
                    child: Text(
                      "Temizle",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  ExpansionTile(
                    title: Text("Hizmetler"),
                    children: [
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: false,
                        onChanged: (value) {
                          setState(() {
                            print('AAA');
                          });
                        },
                        title: Text(
                          'Hizmet 1',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: true,
                        onChanged: (value) {
                          setState(() {
                            print('AAA');
                          });
                        },
                        title: Text(
                          'Hizmet 2',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: false,
                        onChanged: (value) {
                          setState(() {
                            print('AAA');
                          });
                        },
                        title: Text(
                          'Hizmet 3',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: true,
                        onChanged: (value) {
                          setState(() {
                            print('AAA');
                          });
                        },
                        title: Text(
                          'Hizmet 4',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                    ],
                    initiallyExpanded: true,
                  ),
                  ExpansionTile(
                    title: Text("Şehir"),
                    children: List.generate(_locStore.ilList.length, (index) {
                      print("${_locStore.ilList.length}");
                      print("${_locStore?.ilList[index].name}");
                      //return Text("${_locStore?.ilList[index].name}");
                      return CheckboxListTile(
                        value: true,
                        onChanged: (value) {
                          print("Değer");
                        },
                        title: Text(
                          _locStore?.ilList[index].name,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      );
                    }),
                    initiallyExpanded: true,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
      appBar: GFAppBar(
        actions: <Widget>[
          new Container(),
        ],
        title: Text(
          ln(context, 'all_sport_halls'),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: LoadAny(
        loadingMsg: ln(context, 'loading'),
        errorMsg: ln(context, 'unexpected_error'),
        finishMsg: ln(context, 'end'),
        status: status,
        footerHeight: 100,
        onLoadMore: getLoadMore,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: SizedBox(
                  height: 50,
                  child: Card(
                    color: AppColors.searchBoxColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    margin: EdgeInsets.zero,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 14,
                          child: InkWell(
                            onTap: () => print('Search'),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.search,
                                size: 22,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          top: 19,
                          child: InkWell(
                            onTap: () => print('Search the Word'),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                ln(context, 'search'),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 70,
                          top: 14,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _scaffoldKey.currentState.openEndDrawer();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.filter_list,
                                size: 22,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          top: 14,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                layout = 'list';
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.format_list_bulleted,
                                size: 22,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 14,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                layout = 'grid';
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.apps,
                                size: 22,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5),
                child: Text(
                  ln(context, 'start_choose_trainer'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              sliver: MultiProvider(
                providers: [
                  Provider<GymStore>(create: (_) => _gymStore),
                ],
                child: Observer(builder: (_) {
                  if (_gymStore.count == 0) {
                    return SliverToBoxAdapter(child: Loading());
                  } else if (layout == 'list') {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: _GFImageOverlay(
                              gym: _gymStore?.allGyms?.results[index],
                            ),
                          );
                        },
                        childCount: _gymStore?.count != 0 ? _gymStore.count : 2,
                      ),
                    );
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
                            return _GFImageOverlay(
                              gym: _gymStore?.allGyms?.results[index],
                            );
                          },
                          childCount:
                              _gymStore?.count != 0 ? _gymStore.count : 2,
                        ));
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
    await _gymStore.getAllGymsByPage(_gymStore.pageLink);
    status = LoadStatus.normal;
    if (_gymStore.pageLink == null) {
      status = LoadStatus.completed;
    }
    setState(() {});
  }
}

class _GFImageOverlay extends StatelessWidget {
  final GymCutResponseModel gym;
  const _GFImageOverlay({Key key, this.gym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFImageOverlay(
      child: InkWell(
        splashColor: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.verified_user,
                        size: 16,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ))),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.verified_user,
                        size: 16,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ))),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 5, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${gym.name}",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ln(context, 'sport_halls'),
                        style: TextStyle(
                            color: AppColors.subtitleColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ])),
          ],
        ),
        onTap: () {
          navigateToRoute(context, Routes.gymDetailWidget,
              routeArgs: GymDetailWidgetArguments(gymId: gym.id));
        },
      ),
      colorFilter: new ColorFilter.mode(
          Colors.black.withOpacity(0.20), BlendMode.darken),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      image: CachedNetworkImageProvider(
          // 'https://api.adorable.io/avatars/565/${gym.id}'),
          'https://i.pravatar.cc/300?img=${gym.id}'),
    );
  }
}
