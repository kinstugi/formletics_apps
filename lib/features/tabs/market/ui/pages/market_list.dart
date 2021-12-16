import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MarketListWidget extends StatefulWidget {
  @override
  _MarketListWidgetState createState() => _MarketListWidgetState();
}

class _MarketListWidgetState extends State<MarketListWidget> {
  final _emailController = TextEditingController();
  final progressKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
          title: Text(ln(context, 'all_supplements'),
              textAlign: TextAlign.left, style: TextStyle(fontSize: 14))),
      body: CustomScrollView(
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
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
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
                                fontWeight: FontWeight.w300),
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
                    )),
                    onTap: () {},
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
              child: Text(ln(context, 'start_working'),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              children: <Widget>[
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    onTap: () {
                      navigateToRoute(context, Routes.marketDetailWidget);
                    },
                  ),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.20), BlendMode.darken),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: CachedNetworkImageProvider(
                      'https://placeimg.com/640/360/211'),
                ),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/212')),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/213')),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/218')),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/214')),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/215')),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/216')),
                GFImageOverlay(
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
                                    ln(context, 'sample_trainer'),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ln(context, 'personal_trainer'),
                                    style: TextStyle(
                                        color: AppColors.subtitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                      ],
                    ),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.darken),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: CachedNetworkImageProvider(
                        'https://placeimg.com/640/360/217')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
