import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/getwidget.dart';

class MarketHomeWidget extends StatefulWidget {
  const MarketHomeWidget({Key key}) : super(key: key);

  @override
  _MarketHomeWidgetState createState() => _MarketHomeWidgetState();
}

class _MarketHomeWidgetState extends State<MarketHomeWidget> {
  final List<String> imageList = [
    "https://placeimg.com/640/360/1",
    "https://placeimg.com/640/360/2",
    "https://placeimg.com/640/360/3",
    "https://placeimg.com/640/360/4",
    "https://placeimg.com/640/360/5",
    "https://placeimg.com/640/360/6",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
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
                            'Arama',
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
              SizedBox(
                height: 10,
              ),
              GFCarousel(
                aspectRatio: 16 / 9,
                autoPlay: true,
                pagination: true,
                items: imageList.map(
                  (url) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: CachedNetworkImage(
                            imageUrl: url, fit: BoxFit.cover),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(() {
                    index;
                  });
                },
              ),
              InkWell(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(ln(context, 'prominent_products'),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                        size: 14,
                      )
                    ]),
                onTap: () {
                  navigateToRoute(context, Routes.marketListWidget);
                },
              ),
              Container(
                  height: size.width * .25,
                  constraints: BoxConstraints(),
                  child: ListView(
                    padding: EdgeInsets.only(right: 20),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                          child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: GFImageOverlay(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.zero,
                                              child: Card(
                                                margin: EdgeInsets.zero,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 8,
                                                  ),
                                                  child: Text(
                                                    '₺110,90',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                color: AppColors.primaryColor,
                                              ),
                                            )),
                                      ]),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, bottom: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ln(context, 'sample_product'),
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  ln(context, 'weight'),
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .subtitleColor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ])),
                                    ],
                                  ),
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.20),
                                      BlendMode.darken),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: CachedNetworkImageProvider(
                                      'https://placeimg.com/640/360/451'))),
                          onTap: () {
                            navigateToRoute(context, Routes.marketDetailWidget);
                          }),
                      SizedBox(width: 10),
                      InkWell(
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  '₺110,90',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                          )),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ln(context, 'sample_product'),
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ln(context, 'weight'),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.subtitleColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ])),
                                  ],
                                ),
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: CachedNetworkImageProvider(
                                    'https://placeimg.com/640/360/452'))),
                        onTap: () {
                          navigateToRoute(context, Routes.marketDetailWidget);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  '₺110,90',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                          )),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ln(context, 'sample_product'),
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ln(context, 'weight'),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.subtitleColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ])),
                                  ],
                                ),
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: CachedNetworkImageProvider(
                                    'https://placeimg.com/640/360/453'))),
                        onTap: () {
                          navigateToRoute(context, Routes.marketDetailWidget);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  '₺110,90',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                          )),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ln(context, 'sample_product'),
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ln(context, 'weight'),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.subtitleColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ])),
                                  ],
                                ),
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: CachedNetworkImageProvider(
                                    'https://placeimg.com/640/360/454'))),
                        onTap: () {
                          navigateToRoute(context, Routes.marketDetailWidget);
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              InkWell(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(ln(context, 'discounted_products'),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                        size: 14,
                      )
                    ]),
                onTap: () {
                  navigateToRoute(context, Routes.marketDetailWidget);
                },
              ),
              Container(
                  constraints: BoxConstraints(
                    maxHeight: size.width * .25,
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(right: 20),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                          child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: GFImageOverlay(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.zero,
                                              child: Card(
                                                margin: EdgeInsets.zero,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 8,
                                                  ),
                                                  child: Text(
                                                    '₺110,90',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                color: AppColors.primaryColor,
                                              ),
                                            )),
                                      ]),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, bottom: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ln(context, 'sample_product'),
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  ln(context, 'weight'),
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .subtitleColor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ])),
                                    ],
                                  ),
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.20),
                                      BlendMode.darken),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: CachedNetworkImageProvider(
                                      'https://placeimg.com/640/360/355'))),
                          onTap: () {
                            navigateToRoute(context, Routes.marketDetailWidget);
                          }),
                      SizedBox(width: 10),
                      InkWell(
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  '₺110,90',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                          )),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ln(context, 'sample_product'),
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ln(context, 'weight'),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.subtitleColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ])),
                                  ],
                                ),
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: CachedNetworkImageProvider(
                                    'https://placeimg.com/640/360/356'))),
                        onTap: () {
                          navigateToRoute(context, Routes.marketDetailWidget);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  '₺110,90',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                          )),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ln(context, 'sample_product'),
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ln(context, 'weight'),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.subtitleColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ])),
                                  ],
                                ),
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: CachedNetworkImageProvider(
                                    'https://placeimg.com/640/360/357'))),
                        onTap: () {
                          navigateToRoute(context, Routes.marketDetailWidget);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GFImageOverlay(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  '₺110,90',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                          )),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ln(context, 'sample_product'),
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ln(context, 'weight'),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.subtitleColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ])),
                                  ],
                                ),
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: CachedNetworkImageProvider(
                                    'https://placeimg.com/640/360/358'))),
                        onTap: () {
                          navigateToRoute(context, Routes.marketDetailWidget);
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
