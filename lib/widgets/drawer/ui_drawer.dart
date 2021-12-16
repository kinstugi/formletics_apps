import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
// import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
// import 'package:formletics/common/models/theme_model.dart';
// import 'package:formletics/common/router/router.gr.dart';
/*import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/getwidget.dart';*/
import 'package:formletics/features/home/ui/pages/home.dart';
import 'package:formletics/features/app/ui/store/app_store.dart';
import 'package:formletics/features/login/ui/store/auth_methods.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/features/profile/ui/page/profile_page.dart';
import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/programs_page.dart';
import 'package:formletics/widgets/drawer/trainer_drawer.dart';
//import 'package:formletics/features/panels/gym_panel/ui/pages/settings/settings_home.dart';
import 'package:provider/provider.dart';

class UiDrawerWidget extends StatefulWidget {
  final int myIndex;

  const UiDrawerWidget({Key key, this.myIndex}) : super(key: key);

  @override
  _UiDrawerWidgetState createState() => _UiDrawerWidgetState();
}

class _UiDrawerWidgetState extends State<UiDrawerWidget> {
  final AppStore _appStore = getIt<AppStore>();
  final LoginStore _loginStore = getIt<LoginStore>();
  bool _isUserTrainer = false;

  @override
  void initState() {
    super.initState();
    _loginStore.checkIsUserTrainer();
  }

  @override
  Widget build(BuildContext context) {
    //final appStyleMode = Provider.of<ThemeModeNotifier>(context);

    //final size = MediaQuery.of(context).size;
    int currentIndex = widget.myIndex;
    bool userLoggedIn = false;
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => getIt<LoginStore>(),
        ),
        Provider<AppStore>(
          create: (_) => _appStore,
        ),
      ],
      child: Observer(builder: (context) {
        if (!_appStore.isAppSettingsLoaded) {
          return Center(
            child: Container(),
          );
        }
        if (_loginStore.isTrainer) {
          return TrainerDrawer(
            logout: () {
              AuthMethods.logOutUser().then((_) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()));
              }).catchError((err) {
                print(err.toString());
              });
            },
          );
        }
        return Drawer(
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        currentIndex: currentIndex,
                      ),
                    ),
                  );
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: userLoggedIn != false
                    ? UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: Theme.of(context).hintColor.withOpacity(0.1),
                        ),
                        accountName: Text(
                          "Sporcu 1",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        accountEmail: Text(
                          "Sporcu Email",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          //backgroundImage: NetworkImage(currentUser.value.image.thumb),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).hintColor.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              ln(context, 'menu'),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const Icon(
                              Icons.close,
                              size: 32,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: Text(ln(context, "home_title")),
                leading: const Icon(Icons.home),
              ),
              ListTile(
                onTap: () {
                  //Navigator.of(context).pushNamed('/routine-home-widget');
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ProfilePage()),
                  );
                },
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  userLoggedIn != false
                      ? ln(context, 'my_profile')
                      : ln(context, 'my_profile'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ProgramsPage()),
                  );
                },
                title: Text(ln(context, "program")),
                leading: const Icon(Icons.bar_chart),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  userLoggedIn != false
                      ? ln(context, 'settings')
                      : ln(context, 'settings'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),

              // ListTile(
              //   onTap: () {
              //     navigateToRoute(context, Routes.trainerPanelHomeWidget);
              //   },
              //   leading: Icon(
              //     Icons.dashboard,
              //     color: Theme.of(context).hintColor.withOpacity(1),
              //   ),
              //   title: Text(
              //     ln(context, 'trainer_panel'),
              //     style: Theme.of(context).textTheme.subtitle1,
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     navigateToRoute(context, Routes.gymPanelHomeWidget);
              //   },
              //   leading: Icon(
              //     Icons.dashboard,
              //     color: Theme.of(context).hintColor.withOpacity(1),
              //   ),
              //   title: Text(
              //     ln(context, 'gym_panel'),
              //     style: Theme.of(context).textTheme.subtitle1,
              //   ),
              // ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  // _loginStore.logout(context);
                  AuthMethods.logOutUser().then((_) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const HomeScreen()));
                  }).catchError((err) {
                    print(err.toString());
                  });
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  ln(context, 'logout_txt'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              /*ListTile(
                onTap: () {
                  //Navigator.of(context).pushNamed('/dashboard-widget');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: currentIndex)));
                  setState(() {
                    currentIndex = 0;
                  });
                },
                leading: Icon(
                  Icons.dashboard,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),

                title: Text(
                  ln(context, 'flow'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              ListTile(
                onTap: () {
                  //Navigator.of(context).pushNamed('/routine-home-widget');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: currentIndex)));
                    setState(() {
                      currentIndex = 1;
                    });
                },
                leading: Icon(
                  Icons.playlist_add_check,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  ln(context, 'program'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: currentIndex)));
                  setState(() {
                    currentIndex = 2;
                  });
                },
                leading: Icon(
                  Icons.location_on,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  ln(context, 'gyms'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              ListTile(
                onTap: () {
                  //Navigator.of(context).pushNamed('/dashboard-widget');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: currentIndex)));
                  setState(() {
                    currentIndex = 3;
                  });
                },
                leading: Icon(
                  Icons.assignment_ind,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  ln(context, 'trainers'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),*/
              /*ListTile(
                onTap: () {
                  //Navigator.of(context).pushNamed('/market-home-widget');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: currentIndex)));
                  setState(() {
                    currentIndex = 4;
                  });
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                title: Text(
                  ln(context, 'supplement'),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),*/

              ListTile(
                dense: true,
                title: Text(
                  ln(context, 'tercih'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Observer(
                builder: (_) {
                  final localeValue = _appStore.language.locale;
                  return ListTile(
                    leading: Switch(
                      value: localeValue == 'en',
                      onChanged: (value) {
                        final locale = localeValue;
                        if (locale == 'en') {
                          _appStore.setAppLanguage(
                              context, supportedL10nLanguages[1]);
                          return;
                        }
                        _appStore.setAppLanguage(
                            context, supportedL10nLanguages.first);
                      },
                    ),
                    title: localeValue == 'en'
                        ? Text(
                            ln(context, 'dil'),
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        : Text(
                            ln(context, 'dil'),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                  );
                },
              ),
              // Observer(
              //   builder: (_) {
              //     final themeValue = _appStore.theme.mode;
              //     return ListTile(
              //       leading: Switch(
              //         value: themeValue == ThemeMode.light,
              //         onChanged: (value) {
              //           if (themeValue == ThemeMode.light) {
              //             _appStore.setAppTheme(
              //               context,
              //               const ThemeModel(mode: ThemeMode.dark),
              //             );
              //             return;
              //           }
              //           _appStore.setAppTheme(
              //             context,
              //             const ThemeModel(mode: ThemeMode.light),
              //           );
              //         },
              //       ),
              //       title: themeValue == ThemeMode.light
              //           ? Text(
              //               ln(context, 'light'),
              //               style: Theme.of(context).textTheme.subtitle1,
              //             )
              //           : Text(
              //               ln(context, 'dark'),
              //               style: Theme.of(context).textTheme.subtitle1,
              //             ),
              //     );
              //   },
              // ),
              /*ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: currentIndex)));
                  setState(() {
                    currentIndex = 1;
                  });
                },
                leading: Icon(
                  Icons.lightbulb,
                  color: Theme
                      .of(context)
                      .hintColor
                      .withOpacity(1),
                ),
                title: Text(
                  Theme.of(context).brightness == Brightness.dark ? "Light Mode" : "Dark Mode",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),*/
              ListTile(
                dense: true,
                title: Text(
                  ln(context, 'versiyon'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            ],
          ),
        );
      }),
    );
    /*return GFDrawer(
      color: AppColors.darkModeBlack,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          SizedBox(height: size.height * .03),
          ListTile(
              leading: const SizedBox(),
              title:
        //Text(ln(context, 'menu'), style: TextStyle(color: AppColors.white)),
              Text(("Anasayfa"), style: TextStyle(color: AppColors.white)),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.close,
                color: AppColors.white,
              )),
          SizedBox(height: size.height * .03),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text(ln(context, 'home_page'),
                style: TextStyle(color: AppColors.white)),
            onTap: () {
              // TODO
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text(ln(context, 'trainer_panel'),
                style: TextStyle(color: AppColors.white)),
            onTap: () {
              navigateToRoute(context, Routes.trainerPanelHomeWidget);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text(ln(context, 'gym_panel'),
                style: TextStyle(color: AppColors.white)),
            onTap: () {
              navigateToRoute(context, Routes.gymPanelHomeWidget);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text(ln(context, 'trainer_registration'),
                style: TextStyle(color: AppColors.white)),
            onTap: () {
              // TODO Navigate to signup_screen
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text(ln(context, 'user_logout'),
                style: TextStyle(color: AppColors.white)),
            onTap: () {
              // TODO: Log Out
            },
          ),
        ],
      ),
    );*/
    /*return GFDrawer(
      color: AppColors.darkModeBlack,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          SizedBox(height: size.height * .03),
          ListTile(
              leading: SizedBox(),
              title: Text('MENU', style: TextStyle(color: AppColors.white)),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.close,
                color: AppColors.white,
              )),
          SizedBox(height: size.height * .06),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text('Anasayfa', style: TextStyle(color: AppColors.white)),
            onTap: null,
          ),
        ],
      ),
    );*/
  }
}
