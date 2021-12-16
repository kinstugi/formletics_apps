import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/search/ui/pages/search_page.dart';
//import 'package:formletics/features/location/ui/store/location_store.dart';
import 'package:formletics/features/tabs/gym/ui/store/gym_store.dart';
import 'package:formletics/features/tabs/gym/ui/store/my_gym_store.dart';
import 'package:formletics/widgets/list_item_card/list_item_card.dart';
import 'package:formletics/widgets/location_selector_widget/location_selector_widget.dart';
import 'package:formletics/widgets/searchbar/custom_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loadany/loadany_widget.dart';
import 'package:provider/provider.dart';

import 'gym_detail.dart';




class GymHomeWidget extends StatefulWidget {
  const GymHomeWidget({Key key}) : super(key: key);

  @override
  _GymHomeWidgetState createState() => _GymHomeWidgetState();
}

class _GymHomeWidgetState extends State<GymHomeWidget> {
  final progressKey = GlobalKey();
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LoadStatus status = LoadStatus.normal;
  GymStore _gymStore = getIt<GymStore>();
  final MyGymStore _myGymStore = MyGymStore();

  //LocationStore _locStore = getIt<LocationStore>();


  final List<String> imageList = [
    "https://placeimg.com/640/360/31",
    "https://placeimg.com/640/360/22",
    "https://placeimg.com/640/360/23",
    "https://placeimg.com/640/360/24",
    "https://placeimg.com/640/360/25",
    "https://placeimg.com/640/360/26",
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _gymStore.resetList();
    _gymStore ??= Provider.of<GymStore>(context);
    // _locStore ??= Provider.of<LocationStore>(context);

    //if (_gymStore.isSucceedAllGyms != StateStatus.SUCCESS) {
    //  _gymStore.getAllGyms();
    // }

    //if (_locStore.isSucceedIl != StateStatus.SUCCESS) {
    //  _locStore.getIl();
    //}

    if (_gymStore.isSucceedGymFeatured != StateStatus.SUCCESS) {
      _gymStore.getGymFeatured();
    }

    if (_gymStore.isSucceedGymNearby != StateStatus.SUCCESS){
      _gymStore.getGymsNearby();
    }

    _myGymStore.getPreference().then((value){
      return _myGymStore.checkFilters().then((value) {
        if (value ){
          _showModal();
        }
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _gymStore.resetList();
    super.dispose();
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
            const CustomAppBar(typeOfSearch: TypeOfSearch.GymSearch),
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
                        Colors.black.withOpacity(0.20),
                        BlendMode.darken,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: CachedNetworkImageProvider(url),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5, bottom: 20),
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
                                    ln(context, 'visit_sport_halls'),
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
                },
              ).toList(),
              onPageChanged: (index) {
                //TODO redundant code
                // setState(() {
                //   index;
                // });
              },
            ),
            InkWell(
              onTap: () {
                navigateToRoute(context, Routes.gymListWidget);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      ln(context, 'prominent_sport_halls'),
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
            ),

            // first one i think
            Container(
                constraints: BoxConstraints(
                  maxHeight: size.width * .25,
                ),
                child: Observer(
                  builder: (_){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _gymStore.gymFeatured.length,
                      itemBuilder: (context, index) {
                        return ListItemCard(
                          title: _gymStore?.gymFeatured[index].name,
                          subtitle: _gymStore?.gymFeatured[index].il,
                          aspectRatio: 3/2,
                          photoUrl: _gymStore?.gymFeatured[index].photo,
                          topLeftIcon: Icon(
                            Icons.verified_user,
                            size: 16,
                            color: Colors.white.withOpacity(0.8)
                          ),
                          topRightIcon: Icon(
                            Icons.verified_user,
                            size: 16,
                            color: Colors.white.withOpacity(0.8)
                          ),
                          onTap: (){
                            navigateToRoute(
                              context,
                              Routes.gymDetailWidget,
                              routeArgs: GymDetailWidgetArguments(
                                gymId: _gymStore?.gymFeatured[index].id
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                )
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    ln(context, 'nearby_sport_halls'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
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
            Container(
              constraints: BoxConstraints(
                maxHeight: size.width * .25,
              ),
              // added this to code
              child: ListOfGymCards(
                _gymStore,
                errorText: "No gyms nearby",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showModal() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> LocationSelectorPanel(
        store: _myGymStore,
      ))
    );

    //to refresh the page
    if (_gymStore.isSucceedGymNearby != StateStatus.SUCCESS){
      _gymStore.getGymsNearby();
    }
    setState(() {});
  }

}



class ListOfGymCards extends StatelessWidget {
  final GymStore store;
  final String errorText;

  const ListOfGymCards(this.store, {this.errorText = "No gyms available"});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        if (store.isSucceedFilteredGymList == StateStatus.LOADING){
          return const Center(child: LinearProgressIndicator());
        }

        if (store.gymsNearby.isEmpty){
          return Center(
            child: Text(
              errorText,
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: store.gymsNearby.length,
          itemBuilder: (context, index) {

            final String _location = "${store.gymsNearby[index].il}/"
                "${store.gymsNearby[index].ilce}/"
                "${store.gymsNearby[index].mahalle}";

            return ListItemCard(
              title: store.gymsNearby[index].name,
              subtitle: _location,
              aspectRatio: 3 / 2,
              photoUrl: store.gymsNearby[index].photo,
              topLeftIcon: Icon(
                Icons.verified_user,
                size: 16,
                color: Colors.white.withOpacity(0.8)
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => GymDetailWidget(
                    gymId: store.gymsNearby[index].id,
                  )
                ));
              },
            );
          },
        );
      },
    );
  }

}
