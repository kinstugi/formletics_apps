import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/sales_chart_widget.dart';
import 'package:getwidget/getwidget.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class TrainerPanelHomeWidget extends StatefulWidget {
  const TrainerPanelHomeWidget({Key key}) : super(key: key);

  @override
  _TrainerPanelHomeWidgetState createState() => _TrainerPanelHomeWidgetState();
}

class _TrainerPanelHomeWidgetState extends State<TrainerPanelHomeWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: GFDrawer(
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
                //Navigator.of(context).pushNamed(PageRouteConstants.home_screen);
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
                //BlocProvider.of<LoginBloc>(context).add(UserLoggedOuted());
                // Navigate to logout
                //logOut();
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
            icon: Stack(
              children: [
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
              ],
            ),
            onPressed: () {
              //Navigator.of(context).pushNamed(PageRouteConstants.basket_screen);
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
                child: Icon(Icons.brightness_1,
                    color: AppColors.primaryColor, size: 9.0),
              )
            ]),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SalesChartWidget(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    navigateToRoute(
                      context,
                      Routes.trainerPanelApproveHomeWidget,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.onayColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.hourglassStart,
                              color: AppColors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
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
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              ln(context, 'pending_approval'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateToRoute(
                      context,
                      Routes.trainerPanelSportsmanHomeWidget,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.running,
                              color: AppColors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
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
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              ln(context, 'service_purchasers'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateToRoute(
                      context,
                      Routes.trainerPanelMessageHomeWidget,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.messageColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.envelope,
                              color: AppColors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
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
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              ln(context, 'messages'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamed(PageRouteConstants.tp_services_screen);
                    navigateToRoute(
                      context,
                      Routes.trainerPanelServiceHomeWidget,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.serviceColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.cogs,
                              color: AppColors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
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
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              ln(context, 'services'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
