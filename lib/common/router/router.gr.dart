// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/ui/pages/home.dart';
import '../../features/login/ui/pages/gym_register.dart';
import '../../features/login/ui/pages/login.dart';
import '../../features/login/ui/pages/register.dart';
import '../../features/page_not_found/ui/pages/page_not_found.dart';
import '../../features/panels/gym_panel/ui/pages/gym_panel_home.dart';
import '../../features/panels/gym_panel/ui/pages/manager/manager_home.dart';
import '../../features/panels/gym_panel/ui/pages/message/messag_home.dart';
import '../../features/panels/gym_panel/ui/pages/settings/settings_home.dart';
import '../../features/panels/gym_panel/ui/pages/trainer/trainer_home.dart';
import '../../features/panels/trainer_panel/data/models/service/response/service.dart';
import '../../features/panels/trainer_panel/data/models/sportsman/response/no.dart';
import '../../features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import '../../features/panels/trainer_panel/data/models/sportsman/response/yes.dart';
import '../../features/panels/trainer_panel/ui/pages/approve/approve_home.dart';
import '../../features/panels/trainer_panel/ui/pages/message/message_home.dart';
import '../../features/panels/trainer_panel/ui/pages/service/service_add.dart';
import '../../features/panels/trainer_panel/ui/pages/service/services_home.dart';
import '../../features/panels/trainer_panel/ui/pages/sportsman/sportsman_home.dart';
import '../../features/panels/trainer_panel/ui/pages/sportsman/sportsman_page_1_user_routines.dart';
import '../../features/panels/trainer_panel/ui/pages/sportsman/sportsman_page_2_create_routine.dart';
import '../../features/panels/trainer_panel/ui/pages/trainer_panel_home.dart';
import '../../features/payment/ui/pages/basket.dart';
import '../../features/payment/ui/pages/payment_screen.dart';
import '../../features/splash/ui/pages/splash.dart';
import '../../features/tabs/dashboard/ui/pages/dashboard.dart';
import '../../features/tabs/gym/ui/pages/gym_detail.dart';
import '../../features/tabs/gym/ui/pages/gym_home.dart';
import '../../features/tabs/gym/ui/pages/gym_list.dart';
import '../../features/tabs/market/ui/pages/market_detail.dart';
import '../../features/tabs/market/ui/pages/market_home.dart';
import '../../features/tabs/market/ui/pages/market_list.dart';
import '../../features/tabs/routine/data/models/routine_exercise_group_model.dart';
import '../../features/tabs/routine/data/models/routine_exercise_list_model.dart';
import '../../features/tabs/routine/data/models/routine_service_list.dart';
import '../../features/tabs/routine/ui/pages/routine_home.dart';
import '../../features/tabs/routine/ui/pages/routine_page_1_services.dart';
import '../../features/tabs/routine/ui/pages/routine_page_2_routine.dart';
import '../../features/tabs/routine/ui/pages/routine_page_3_exercise_group.dart';
import '../../features/tabs/routine/ui/pages/routine_page_4_exercise_detail.dart';
import '../../features/tabs/trainer/ui/pages/trainer_detail.dart';
import '../../features/tabs/trainer/ui/pages/trainer_home.dart';
import '../../features/tabs/trainer/ui/pages/trainer_list.dart';
import 'animations.dart';
import 'router_auth_guard.dart';

class Routes {
  static const String homeScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String gymRegisterScreen = '/gym-register-screen';
  static const String splashScreen = '/splash-screen';
  static const String paymentBasketWidget = '/payment-basket-widget';
  static const String payment3dScreen = '/payment3d-screen';
  static const String dashboardWidget = '/dashboard-widget';
  static const String routineHomeWidget = '/routine-home-widget';
  static const String routine1ServicesWidget = '/routine1-services-widget';
  static const String routine2RoutineWidget = '/routine2-routine-widget';
  static const String routine3ExerciseGroupWidget =
      '/routine3-exercise-group-widget';
  static const String routine4ExerciseDetailWidget =
      '/routine4-exercise-detail-widget';
  static const String gymHomeWidget = '/gym-home-widget';
  static const String gymDetailWidget = '/gym-detail-widget';
  static const String gymListWidget = '/gym-list-widget';
  static const String trainerHomeWidget = '/trainer-home-widget';
  static const String trainerDetailWidget = '/trainer-detail-widget';
  static const String trainerListWidget = '/trainer-list-widget';
  static const String marketHomeWidget = '/market-home-widget';
  static const String marketDetailWidget = '/market-detail-widget';
  static const String marketListWidget = '/market-list-widget';
  static const String trainerPanelHomeWidget = '/trainer-panel-home-widget';
  static const String trainerPanelApproveHomeWidget =
      '/trainer-panel-approve-home-widget';
  static const String trainerPanelSportsmanHomeWidget =
      '/trainer-panel-sportsman-home-widget';
  static const String trainerPanelSportsman1UserDetailWidget =
      '/trainer-panel-sportsman1-user-detail-widget';
  static const String trainerPanelSportsman2CreateRoutineWidget =
      '/trainer-panel-sportsman2-create-routine-widget';
  static const String trainerPanelMessageHomeWidget =
      '/trainer-panel-message-home-widget';
  static const String trainerPanelServiceHomeWidget =
      '/trainer-panel-service-home-widget';
  static const String trainerPanelServiceAddWidget =
      '/trainer-panel-service-add-widget';
  static const String gymPanelHomeWidget = '/gym-panel-home-widget';
  static const String gymPanelTrainerHomeWidget =
      '/gym-panel-trainer-home-widget';
  static const String gymPanelManagerHomeWidget =
      '/gym-panel-manager-home-widget';
  static const String gymPanelMessageHomeWidget =
      '/gym-panel-message-home-widget';
  static const String gymPanelSettingHomeWidget =
      '/gym-panel-setting-home-widget';
  static const String pageNotFoundScreen = '*';
  static const all = <String>{
    homeScreen,
    loginScreen,
    registerScreen,
    gymRegisterScreen,
    splashScreen,
    paymentBasketWidget,
    payment3dScreen,
    dashboardWidget,
    routineHomeWidget,
    routine1ServicesWidget,
    routine2RoutineWidget,
    routine3ExerciseGroupWidget,
    routine4ExerciseDetailWidget,
    gymHomeWidget,
    gymDetailWidget,
    gymListWidget,
    trainerHomeWidget,
    trainerDetailWidget,
    trainerListWidget,
    marketHomeWidget,
    marketDetailWidget,
    marketListWidget,
    trainerPanelHomeWidget,
    trainerPanelApproveHomeWidget,
    trainerPanelSportsmanHomeWidget,
    trainerPanelSportsman1UserDetailWidget,
    trainerPanelSportsman2CreateRoutineWidget,
    trainerPanelMessageHomeWidget,
    trainerPanelServiceHomeWidget,
    trainerPanelServiceAddWidget,
    gymPanelHomeWidget,
    gymPanelTrainerHomeWidget,
    gymPanelManagerHomeWidget,
    gymPanelMessageHomeWidget,
    gymPanelSettingHomeWidget,
    pageNotFoundScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeScreen, page: HomeScreen, guards: [RouterAuthGuard]),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
    RouteDef(Routes.gymRegisterScreen, page: GymRegisterScreen),
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.paymentBasketWidget, page: PaymentBasketWidget),
    RouteDef(Routes.payment3dScreen, page: Payment3dScreen),
    RouteDef(Routes.dashboardWidget, page: DashboardWidget),
    RouteDef(Routes.routineHomeWidget, page: RoutineHomeWidget),
    RouteDef(Routes.routine1ServicesWidget, page: Routine1ServicesWidget),
    RouteDef(Routes.routine2RoutineWidget, page: Routine2RoutineWidget),
    RouteDef(Routes.routine3ExerciseGroupWidget,
        page: Routine3ExerciseGroupWidget),
    RouteDef(Routes.routine4ExerciseDetailWidget,
        page: Routine4ExerciseDetailWidget),
    RouteDef(Routes.gymHomeWidget, page: GymHomeWidget),
    RouteDef(Routes.gymDetailWidget, page: GymDetailWidget),
    RouteDef(Routes.gymListWidget, page: GymListWidget),
    RouteDef(Routes.trainerHomeWidget, page: TrainerHomeWidget),
    RouteDef(Routes.trainerDetailWidget, page: TrainerDetailWidget),
    RouteDef(Routes.trainerListWidget, page: TrainerListWidget),
    RouteDef(Routes.marketHomeWidget, page: MarketHomeWidget),
    RouteDef(Routes.marketDetailWidget, page: MarketDetailWidget),
    RouteDef(Routes.marketListWidget, page: MarketListWidget),
    RouteDef(Routes.trainerPanelHomeWidget, page: TrainerPanelHomeWidget),
    RouteDef(Routes.trainerPanelApproveHomeWidget,
        page: TrainerPanelApproveHomeWidget),
    RouteDef(Routes.trainerPanelSportsmanHomeWidget,
        page: TrainerPanelSportsmanHomeWidget),
    RouteDef(Routes.trainerPanelSportsman1UserDetailWidget,
        page: TrainerPanelSportsman1UserDetailWidget),
    RouteDef(Routes.trainerPanelSportsman2CreateRoutineWidget,
        page: TrainerPanelSportsman2CreateRoutineWidget),
    RouteDef(Routes.trainerPanelMessageHomeWidget,
        page: TrainerPanelMessageHomeWidget),
    RouteDef(Routes.trainerPanelServiceHomeWidget,
        page: TrainerPanelServiceHomeWidget),
    RouteDef(Routes.trainerPanelServiceAddWidget,
        page: TrainerPanelServiceAddWidget),
    RouteDef(Routes.gymPanelHomeWidget, page: GymPanelHomeWidget),
    RouteDef(Routes.gymPanelTrainerHomeWidget, page: GymPanelTrainerHomeWidget),
    RouteDef(Routes.gymPanelManagerHomeWidget, page: GymPanelManagerHomeWidget),
    RouteDef(Routes.gymPanelMessageHomeWidget, page: GymPanelMessageHomeWidget),
    RouteDef(Routes.gymPanelSettingHomeWidget, page: GymPanelSettingHomeWidget),
    RouteDef(Routes.pageNotFoundScreen, page: PageNotFoundScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeScreen: (data) {
      final args = data.getArgs<HomeScreenArguments>(
        orElse: () => HomeScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(
          key: args.key,
          basketIcon: args.basketIcon,
          currentIndex: args.currentIndex,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
      );
    },
    LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => LoginScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(
          key: args.key,
          redirectRouteName: args.redirectRouteName,
          redirectRouteArgs: args.redirectRouteArgs,
          actualPage: args.actualPage,
          proceedToRegister: args.proceedToRegister,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    RegisterScreen: (data) {
      final args = data.getArgs<RegisterScreenArguments>(
        orElse: () => RegisterScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => RegisterScreen(
          key: args.key,
          redirectRouteName: args.redirectRouteName,
          redirectRouteArgs: args.redirectRouteArgs,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    GymRegisterScreen: (data) {
      final args = data.getArgs<GymRegisterScreenArguments>(
        orElse: () => GymRegisterScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymRegisterScreen(
          key: args.key,
          redirectRouteName: args.redirectRouteName,
          redirectRouteArgs: args.redirectRouteArgs,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    SplashScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SplashScreen(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 1500),
      );
    },
    PaymentBasketWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PaymentBasketWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    Payment3dScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Payment3dScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    DashboardWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DashboardWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    RoutineHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RoutineHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    Routine1ServicesWidget: (data) {
      final args = data.getArgs<Routine1ServicesWidgetArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Routine1ServicesWidget(
          key: args.key,
          trainerId: args.trainerId,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    Routine2RoutineWidget: (data) {
      final args = data.getArgs<Routine2RoutineWidgetArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Routine2RoutineWidget(
          key: args.key,
          routine: args.routine,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    Routine3ExerciseGroupWidget: (data) {
      final args =
          data.getArgs<Routine3ExerciseGroupWidgetArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Routine3ExerciseGroupWidget(
          key: args.key,
          group: args.group,
          dayNumber: args.dayNumber,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    Routine4ExerciseDetailWidget: (data) {
      final args =
          data.getArgs<Routine4ExerciseDetailWidgetArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Routine4ExerciseDetailWidget(
          key: args.key,
          exercise: args.exercise,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const GymHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymDetailWidget: (data) {
      final args = data.getArgs<GymDetailWidgetArguments>(
        orElse: () => GymDetailWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymDetailWidget(
          key: args.key,
          gymId: args.gymId,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymListWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymListWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TrainerHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerDetailWidget: (data) {
      final args = data.getArgs<TrainerDetailWidgetArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerDetailWidget(
          key: args.key,
          trainerId: args.trainerId,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerListWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerListWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    MarketHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MarketHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    MarketDetailWidget: (data) {
      final args = data.getArgs<MarketDetailWidgetArguments>(
        orElse: () => MarketDetailWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MarketDetailWidget(key: args.key),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    MarketListWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MarketListWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TrainerPanelHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelApproveHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelApproveHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelSportsmanHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelSportsmanHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelSportsman1UserDetailWidget: (data) {
      final args =
          data.getArgs<TrainerPanelSportsman1UserDetailWidgetArguments>(
        orElse: () => TrainerPanelSportsman1UserDetailWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelSportsman1UserDetailWidget(
          key: args.key,
          routine: args.routine,
          service: args.service,
          history: args.history,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelSportsman2CreateRoutineWidget: (data) {
      final args =
          data.getArgs<TrainerPanelSportsman2CreateRoutineWidgetArguments>(
        orElse: () => TrainerPanelSportsman2CreateRoutineWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelSportsman2CreateRoutineWidget(
          key: args.key,
          service: args.service,
          routine: args.routine,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelMessageHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelMessageHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelServiceHomeWidget: (data) {
      final args = data.getArgs<TrainerPanelServiceHomeWidgetArguments>(
        orElse: () => TrainerPanelServiceHomeWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelServiceHomeWidget(
          key: args.key,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    TrainerPanelServiceAddWidget: (data) {
      final args = data.getArgs<TrainerPanelServiceAddWidgetArguments>(
        orElse: () => TrainerPanelServiceAddWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TrainerPanelServiceAddWidget(
          key: args.key,
          model: args.model,
        ),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymPanelHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const GymPanelHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymPanelTrainerHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymPanelTrainerHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymPanelManagerHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymPanelManagerHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymPanelMessageHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymPanelMessageHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    GymPanelSettingHomeWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GymPanelSettingHomeWidget(),
        settings: data,
        transitionsBuilder: FadeUpTranstion,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    PageNotFoundScreen: (data) {
      final args = data.getArgs<PageNotFoundScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PageNotFoundScreen(args.routeName),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeScreen arguments holder class
class HomeScreenArguments {
  final Key key;
  final bool basketIcon;
  final int currentIndex;
  HomeScreenArguments({this.key, this.basketIcon, this.currentIndex});
}

/// LoginScreen arguments holder class
class LoginScreenArguments {
  final Key key;
  final String redirectRouteName;
  final Object redirectRouteArgs;
  final bool actualPage;
  final bool proceedToRegister;
  LoginScreenArguments(
      {this.key,
      this.redirectRouteName,
      this.redirectRouteArgs,
      this.actualPage = false,
      this.proceedToRegister = false});
}

/// RegisterScreen arguments holder class
class RegisterScreenArguments {
  final Key key;
  final String redirectRouteName;
  final Object redirectRouteArgs;
  RegisterScreenArguments(
      {this.key, this.redirectRouteName, this.redirectRouteArgs});
}

/// GymRegisterScreen arguments holder class
class GymRegisterScreenArguments {
  final Key key;
  final String redirectRouteName;
  final Object redirectRouteArgs;
  GymRegisterScreenArguments(
      {this.key, this.redirectRouteName, this.redirectRouteArgs});
}

/// Routine1ServicesWidget arguments holder class
class Routine1ServicesWidgetArguments {
  final Key key;
  final int trainerId;
  Routine1ServicesWidgetArguments({this.key, @required this.trainerId});
}

/// Routine2RoutineWidget arguments holder class
class Routine2RoutineWidgetArguments {
  final Key key;
  final RoutineServiceListResponseModel routine;
  Routine2RoutineWidgetArguments({this.key, @required this.routine});
}

/// Routine3ExerciseGroupWidget arguments holder class
class Routine3ExerciseGroupWidgetArguments {
  final Key key;
  final List<RoutineExerciseGroupResponseModel> group;
  final int dayNumber;
  Routine3ExerciseGroupWidgetArguments(
      {this.key, @required this.group, @required this.dayNumber});
}

/// Routine4ExerciseDetailWidget arguments holder class
class Routine4ExerciseDetailWidgetArguments {
  final Key key;
  final RoutineExerciseListResponseModel exercise;
  Routine4ExerciseDetailWidgetArguments({this.key, @required this.exercise});
}

/// GymDetailWidget arguments holder class
class GymDetailWidgetArguments {
  final Key key;
  final int gymId;
  GymDetailWidgetArguments({this.key, this.gymId});
}

/// TrainerDetailWidget arguments holder class
class TrainerDetailWidgetArguments {
  final Key key;
  final int trainerId;
  TrainerDetailWidgetArguments({this.key, @required this.trainerId});
}

/// MarketDetailWidget arguments holder class
class MarketDetailWidgetArguments {
  final Key key;
  MarketDetailWidgetArguments({this.key});
}

/// TrainerPanelSportsman1UserDetailWidget arguments holder class
class TrainerPanelSportsman1UserDetailWidgetArguments {
  final Key key;
  final TrainerPanelSportsmanResponseModel routine;
  final TrainerPanelSportsmanNestedNo service;
  final List<TrainerPanelSportsmanNestedYes> history;
  TrainerPanelSportsman1UserDetailWidgetArguments(
      {this.key, this.routine, this.service, this.history});
}

/// TrainerPanelSportsman2CreateRoutineWidget arguments holder class
class TrainerPanelSportsman2CreateRoutineWidgetArguments {
  final Key key;
  final TrainerPanelSportsmanNestedNo service;
  final TrainerPanelSportsmanResponseModel routine;
  TrainerPanelSportsman2CreateRoutineWidgetArguments(
      {this.key, this.service, this.routine});
}

/// TrainerPanelServiceHomeWidget arguments holder class
class TrainerPanelServiceHomeWidgetArguments {
  final Key key;
  final String message;
  TrainerPanelServiceHomeWidgetArguments({this.key, this.message});
}

/// TrainerPanelServiceAddWidget arguments holder class
class TrainerPanelServiceAddWidgetArguments {
  final Key key;
  final TrainerPanelServiceResponseModel model;
  TrainerPanelServiceAddWidgetArguments({this.key, this.model});
}

/// PageNotFoundScreen arguments holder class
class PageNotFoundScreenArguments {
  final String routeName;
  PageNotFoundScreenArguments({@required this.routeName});
}
