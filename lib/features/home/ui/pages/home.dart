import 'package:flutter/material.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/dashboard/ui/pages/dashboard.dart';
import 'package:formletics/features/tabs/gym/ui/pages/gym_home.dart';
import 'package:formletics/features/tabs/market/ui/pages/market_home.dart';
import 'package:formletics/features/tabs/routine/ui/pages/routine_home.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_home.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:formletics/widgets/drawer/ui_drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:formletics/features/app/ui/store/app_store.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final bool basketIcon;
  final int currentIndex;
  const HomeScreen({Key key, this.basketIcon, this.currentIndex}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(currentIndex:currentIndex);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({this.currentIndex});
  int currentIndex;
  int _currentIndex=0;
  List<ReactionDisposer> _disposers;
  Alerts _alerts;
  LoginStore _loginStore;
  AppStore _appStore;
  bool test = false;
  final PageController _controller = PageController();
  //int _count = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _alerts ??= getIt<Alerts>();
    _loginStore ??= Provider.of<LoginStore>(context);
    _appStore ??= Provider.of<AppStore>(context);
  }

  @override
  void dispose() {
    if (_disposers != null) {
      _disposers.map((a) {
        a();
      });
    }

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    currentIndex == null ? _currentIndex=0 : _currentIndex= currentIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _children = <Widget>[
      const DashboardWidget(),
      const RoutineHomeWidget(),
      const GymHomeWidget(),
      const TrainerHomeWidget(),
      const MarketHomeWidget()
    ];
    //final size = MediaQuery.of(context).size;

      return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          drawer: const UiDrawerWidget(),
          //drawer: GFDrawer(),
          appBar: GFAppBar(
            title: const Text('FORMLETICS'),
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
                        color: AppColors.primaryColor, size: 9.0,),
                  )
                ]),
                onPressed: () {},
              ),
            ],
          ),
          // _children[_currentIndex]
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: _children,
          ),
          bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: AppColors.darkModeBlack,
            //selectedItemColor: AppColors.white,
            unselectedItemColor: Theme.of(context).hintColor.withOpacity(1),
            selectedItemColor: Theme.of(context).accentColor.withOpacity(1),
            //unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.4),
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard),
                label: ln(context, 'flow'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.playlist_add_check),
                label: ln(context, 'program'),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.location_on), label: ln(context, 'gyms')),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_add),
                label: ln(context, 'trainers'),
              ),
/*              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: ln(context, 'supplement')),*/
            ],
          ),
        ),
      );

  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn
      );
    });
  }

  // ignore: type_annotate_public_apis
  // ignore: always_declare_return_types
  // ignore: type_annotate_public_apis
  logOut() async {
    Navigator.pop(context);
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to Login Screen
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(ln(context, 'are_you_sure')),
              content: Text(ln(context, 'logout_warning')),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(ln(context, 'no')),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(ln(context, 'yes')),
                )
              ],
            );
          },
        ) ??
        Future.value(false);
  }
}
