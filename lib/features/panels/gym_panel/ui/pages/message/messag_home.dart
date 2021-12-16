import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/getwidget.dart';

class GymPanelMessageHomeWidget extends StatefulWidget {
  @override
  _GymPanelMessageHomeWidgetState createState() =>
      _GymPanelMessageHomeWidgetState();
}

class _GymPanelMessageHomeWidgetState extends State<GymPanelMessageHomeWidget> {
  final _emailController = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
          title: Text(ln(context, 'messages'),
              textAlign: TextAlign.left, style: TextStyle(fontSize: 14))),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 3,
                    bottom: 3,
                  ),
                  height: 80,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ]),
                  child: Card(
                    color: AppColors.darkModeBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    ln(context, 'sample_sportsman_1'),
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              ln(context, 'sample_message_1'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: AppColors.messageColor
                                          .withOpacity(.6),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                ln(context, 'sample_service_1'),
                                style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.search,
                                      color: AppColors.white,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ln(context, 'see'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: AppColors.purple.withOpacity(.1),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 3,
                    bottom: 3,
                  ),
                  height: 80,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ]),
                  child: Card(
                    color: AppColors.darkModeBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    ln(context, 'sample_sportsman_2'),
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              ln(context, 'sample_message_2'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: AppColors.messageColor
                                          .withOpacity(.6),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                ln(context, 'sample_service_2'),
                                style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.search,
                                      color: AppColors.white,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ln(context, 'see'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: AppColors.purple.withOpacity(.1),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 3,
                    bottom: 3,
                  ),
                  height: 80,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ]),
                  child: Card(
                    color: AppColors.darkModeBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    ln(context, 'sample_sportsman_3'),
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              ln(context, 'sample_message_3'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: AppColors.messageColor
                                          .withOpacity(.6),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                ln(context, 'sample_service_3'),
                                style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.search,
                                      color: AppColors.white,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ln(context, 'see'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: AppColors.purple.withOpacity(.1),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 3,
                    bottom: 3,
                  ),
                  height: 80,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ]),
                  child: Card(
                    color: AppColors.darkModeBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    ln(context, 'sample_sportsman_4'),
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              ln(context, 'sample_message_4'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: AppColors.messageColor
                                          .withOpacity(.6),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                ln(context, 'sample_service_4'),
                                style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.search,
                                      color: AppColors.white,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ln(context, 'see'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: AppColors.purple.withOpacity(.1),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 3,
                    bottom: 3,
                  ),
                  height: 80,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ]),
                  child: Card(
                    color: AppColors.darkModeBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    ln(context, 'sample_sportsman_5'),
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              ln(context, 'sample_message_5'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: AppColors.messageColor
                                          .withOpacity(.6),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                ln(context, 'sample_service_5'),
                                style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.search,
                                      color: AppColors.white,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ln(context, 'see'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: AppColors.purple.withOpacity(.1),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )
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
