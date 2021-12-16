import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:formletics/common/router/animations.dart';
import 'package:formletics/common/router/router_auth_guard.dart';
// import 'package:formletics/common/router/router_auth_guard.dart';
import 'package:formletics/features/home/ui/pages/home.dart';
import 'package:formletics/features/login/ui/pages/gym_register.dart';
import 'package:formletics/features/login/ui/pages/login.dart';
import 'package:formletics/features/login/ui/pages/register.dart';
import 'package:formletics/features/page_not_found/ui/pages/page_not_found.dart';
import 'package:formletics/features/panels/gym_panel/ui/pages/gym_panel_home.dart';
import 'package:formletics/features/panels/gym_panel/ui/pages/manager/manager_home.dart';
import 'package:formletics/features/panels/gym_panel/ui/pages/message/messag_home.dart';
import 'package:formletics/features/panels/gym_panel/ui/pages/settings/settings_home.dart';
import 'package:formletics/features/panels/gym_panel/ui/pages/trainer/trainer_home.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/approve/approve_home.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/message/message_home.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/service/service_add.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/service/services_home.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/sportsman/sportsman_home.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/sportsman/sportsman_page_1_user_routines.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/sportsman/sportsman_page_2_create_routine.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/trainer_panel_home.dart';
import 'package:formletics/features/payment/ui/pages/basket.dart';
import 'package:formletics/features/payment/ui/pages/payment_screen.dart';
import 'package:formletics/features/splash/ui/pages/splash.dart';
import 'package:formletics/features/tabs/dashboard/ui/pages/dashboard.dart';
import 'package:formletics/features/tabs/gym/ui/pages/gym_detail.dart';
import 'package:formletics/features/tabs/gym/ui/pages/gym_home.dart';
import 'package:formletics/features/tabs/gym/ui/pages/gym_list.dart';
import 'package:formletics/features/tabs/market/ui/pages/market_detail.dart';
import 'package:formletics/features/tabs/market/ui/pages/market_home.dart';
import 'package:formletics/features/tabs/market/ui/pages/market_list.dart';
import 'package:formletics/features/tabs/routine/ui/pages/routine_home.dart';
import 'package:formletics/features/tabs/routine/ui/pages/routine_page_1_services.dart';
import 'package:formletics/features/tabs/routine/ui/pages/routine_page_2_routine.dart';
import 'package:formletics/features/tabs/routine/ui/pages/routine_page_3_exercise_group.dart';
import 'package:formletics/features/tabs/routine/ui/pages/routine_page_4_exercise_detail.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_detail.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_home.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_list.dart';
import 'router_auth_guard.dart';

@MaterialAutoRouter(
  routes: [
    // Home Screen
    CustomRoute(
        page: HomeScreen, transitionsBuilder: FadeUpTranstion, initial: true, guards: [RouterAuthGuard]
    ),

    // General Pages
    CustomRoute(
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: RegisterScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: GymRegisterScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
        page: SplashScreen,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 1500),

    /* Payment Pages */
    // Payment:Basket
    CustomRoute(
      page: PaymentBasketWidget,
      transitionsBuilder: FadeUpTranstion,
      durationInMilliseconds: 300
    ),

    CustomRoute(
      page: Payment3dScreen,
      transitionsBuilder:  TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300
    ),

    // Dashboard Tab
    CustomRoute(
      page: DashboardWidget,
      transitionsBuilder: FadeUpTranstion,
      durationInMilliseconds: 300
    ),

    /* Routine Tab Pages */
    // Routine Home
    CustomRoute(
      page: RoutineHomeWidget,
      transitionsBuilder: FadeUpTranstion,
      durationInMilliseconds: 300
    ),
    // Routine 1: Service
    CustomRoute(
        page: Routine1ServicesWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Routine 2: Routine
    CustomRoute(
        page: Routine2RoutineWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Routine 3: Exercise Day
    CustomRoute(
        page: Routine3ExerciseGroupWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Routine 4: Exercise Detail
    CustomRoute(
        page: Routine4ExerciseDetailWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),

    /* Gym Tab Pages */
    // Gym: Home Page
    CustomRoute(
        page: GymHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Gym: Detail
    CustomRoute(
        page: GymDetailWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Gym: List
    CustomRoute(
        page: GymListWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),

    /* Trainers Tab Pages */
    // Trainers Home
    CustomRoute(
        page: TrainerHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainers Detail
    CustomRoute(
        page: TrainerDetailWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainers List
    CustomRoute(
        page: TrainerListWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),

    /* Market Tab Pages */
    // Market Home
    CustomRoute(
        page: MarketHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Market Detail
    CustomRoute(
        page: MarketDetailWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Market List
    CustomRoute(
        page: MarketListWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),

    /* Panels */

    /* Trainer Panel */
    // Trainer Panel: Home
    CustomRoute(
        page: TrainerPanelHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Approve: Home
    CustomRoute(
        page: TrainerPanelApproveHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Sportsman: Home
    CustomRoute(
        page: TrainerPanelSportsmanHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Sportsman: Page 1 User Detail
    CustomRoute(
        page: TrainerPanelSportsman1UserDetailWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Sportsman: Page 2 Create Routine
    CustomRoute(
        page: TrainerPanelSportsman2CreateRoutineWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Message: Home
    CustomRoute(
        page: TrainerPanelMessageHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Service: Home
    CustomRoute(
        page: TrainerPanelServiceHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Trainer Panel: Service: Add
    CustomRoute(
        page: TrainerPanelServiceAddWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),

    /* Gym Panel */
    // Gym Panel: Home
    CustomRoute(
        page: GymPanelHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Gym Panel: Trainer Home
    CustomRoute(
        page: GymPanelTrainerHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Gym Panel: Manager Home
    CustomRoute(
        page: GymPanelManagerHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Gym Panel: Message Home
    CustomRoute(
        page: GymPanelMessageHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    // Gym Panel: Setting Home
    CustomRoute(
        page: GymPanelSettingHomeWidget,
        transitionsBuilder: FadeUpTranstion,
        durationInMilliseconds: 300),
    MaterialRoute(path: '*', page: PageNotFoundScreen),
  ],
)
class $Router {}
