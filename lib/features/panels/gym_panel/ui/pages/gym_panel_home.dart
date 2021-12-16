import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GymPanelHomeWidget extends StatefulWidget {
  const GymPanelHomeWidget({Key key}) : super(key: key);

  @override
  _GymPanelHomeWidgetState createState() => _GymPanelHomeWidgetState();
}

class _GymPanelHomeWidgetState extends State<GymPanelHomeWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: GFDrawer(
        color: AppColors.darkModeBlack,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          children: <Widget>[
            SizedBox(height: size.height * .03),
            ListTile(
                leading: const SizedBox(),
                title: Text(ln(context, 'menu'),
                    style: TextStyle(color: AppColors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
            ),
            SizedBox(height: size.height * .06),
            ListTile(
              leading: Icon(
                Icons.home,
                color: AppColors.white,
              ),
              title: Text(ln(context, 'home_page'),
                  style: TextStyle(color: AppColors.white)),
              onTap: () {
                navigateToRoute(context, Routes.homeScreen);
              },
            ),
            SizedBox(height: size.height * .06),
            ListTile(
              leading: Icon(
                Icons.home,
                color: AppColors.white,
              ),
              title: Text(ln(context, 'user_logout'),
                  style: TextStyle(color: AppColors.white)),
              onTap: () {
                // BlocProvider.of<LoginBloc>(context).add(UserLoggedOuted());
                // logOut();
              },
            ),
          ],
        ),
      ),
      appBar: GFAppBar(
        title: const Text("FORMLETICS"),
        centerTitle: true,
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            icon: Stack(children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 22,
              ),
              Positioned(
                left: 10,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: AppColors.primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      '12',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              )
            ]),
            onPressed: () {
              // Navigator.of(context).pushNamed(PageRouteConstants.basket_screen);
              navigateToRoute(context, Routes.paymentBasketWidget);
            },
          ),
          IconButton(
            icon: Stack(children: [
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 22,
              ),
              Positioned(
                left: 12,
                child: Icon(
                  Icons.brightness_1,
                  color: AppColors.primaryColor, size: 9.0
                ),
              )
            ]),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 5,
              ),
              child: GFImageOverlay(
                  height: size.width * .35,
                  width: size.width,
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
                  )),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.20), BlendMode.darken),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: CachedNetworkImageProvider(
                      'https://placeimg.com/640/360/2')),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
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
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.onayColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: FaIcon(FontAwesomeIcons.hourglassStart,
                              color: AppColors.white, size: 32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            "4",
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.30),
                              fontSize: 120,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 20),
                            child: Text(
                              ln(context, 'trainers'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ]),
                  ),
                  onTap: () {
                    navigateToRoute(context, Routes.gymPanelTrainerHomeWidget);
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: FaIcon(FontAwesomeIcons.running,
                              color: AppColors.white, size: 32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            "3",
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.30),
                              fontSize: 120,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 20),
                            child: Text(
                              ln(context, 'executives'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ]),
                  ),
                  onTap: () {
                    navigateToRoute(context, Routes.gymPanelManagerHomeWidget);
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.messageColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: FaIcon(FontAwesomeIcons.envelope,
                              color: AppColors.white, size: 32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            "72",
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.30),
                              fontSize: 120,
                              letterSpacing: -12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 20),
                            child: Text(
                              ln(context, 'messages'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ]),
                  ),
                  onTap: () {
                    navigateToRoute(context, Routes.gymPanelMessageHomeWidget);
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.serviceColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: FaIcon(FontAwesomeIcons.cogs,
                              color: AppColors.white, size: 32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            "7",
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.30),
                              fontSize: 120,
                              letterSpacing: -12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 20),
                            child: Text(
                              ln(context, 'settings'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ]),
                  ),
                  onTap: () {
                    navigateToRoute(context, Routes.gymPanelSettingHomeWidget);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void logOut() async {
  //   Navigator.pop(context);
  //   await Future.delayed(Duration(seconds: 1));

  //   Navigator.of(context).pushAndRemoveUntil(
  //     // the new route
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => LoginScreen(),
  //     ),
  //     (Route route) => false,
  //   );
  // }
}
