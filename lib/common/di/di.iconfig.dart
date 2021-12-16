// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:formletics/services/analytics_service.dart';
import 'package:formletics/services/crashes_service.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:formletics/common/di/network_info_di.dart';
import 'package:dio/dio.dart';
import 'package:formletics/common/di/dio_di.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/helpers/flushbar_helper.dart';
import 'package:logger/logger.dart';
import 'package:formletics/common/di/logger_di.dart';
import 'package:formletics/common/network/network_info.dart';
import 'package:formletics/services/pushes_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:formletics/common/di/shared_preferences_di.dart';
import 'package:formletics/utils/alerts/alerts_helper.dart';
import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/app/data/data_sources/app_local_data_source.dart';
import 'package:formletics/features/app/data/repositories/app_repository.dart';
import 'package:formletics/utils/log/log_it.dart';
import 'package:formletics/features/login/data/data_sources/login_local_data_source.dart';
import 'package:formletics/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:formletics/features/login/data/repositories/login_repository.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:formletics/features/app/data/controllers/app_controller.dart';
import 'package:formletics/features/app/ui/store/app_store.dart';
import 'package:formletics/features/tabs/dashboard/ui/store/dashboard_store.dart';
import 'package:formletics/features/panels/gym_panel/ui/store/gym_panel_store.dart';
import 'package:formletics/features/tabs/gym/ui/store/gym_store.dart';
import 'package:formletics/features/location/ui/store/location_store.dart';
import 'package:formletics/features/login/data/controllers/login_controller.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/features/payment/ui/store/payment_store.dart';
import 'package:formletics/features/tabs/photo/ui/store/photo_store.dart';
import 'package:formletics/features/tabs/routine/ui/store/routine_store.dart';
import 'package:formletics/features/search/ui/stores/search_store.dart';
import 'package:formletics/features/apitest/ui/store/todo_store.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/features/tabs/trainer/ui/store/trainer_store.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final networkInfoDi = _$NetworkInfoDi();
  final dioDi = _$DioDi();
  final loggerDi = _$LoggerDi();
  final sharedPreferencesDi = _$SharedPreferencesDi();
  g.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  g.registerLazySingleton<CrashesService>(() => CrashesService());
  g.registerLazySingleton<DataConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  g.registerLazySingleton<Dio>(() => dioDi.dio);
  g.registerLazySingleton<FlashHelper>(() => FlashHelper());
  g.registerLazySingleton<FlushbarHelper>(() => FlushbarHelper());
  g.registerLazySingleton<Logger>(() => loggerDi.logger);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(g<DataConnectionChecker>()));
  g.registerLazySingleton<PushesService>(() => PushesService());
  final sharedPreferences = await sharedPreferencesDi.sharedPreferences;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerLazySingleton<AlertsHelper>(
      () => AlertsHelper(g<CrashesService>()));
  g.registerLazySingleton<ApiClient>(() => ApiClient(g<Dio>()));
  g.registerLazySingleton<AppLocalDataSource>(
      () => AppLocalDataSource(g<SharedPreferences>()));
  g.registerLazySingleton<AppRepository>(
      () => AppRepository(g<AppLocalDataSource>()));
  g.registerLazySingleton<LogIt>(() => LogIt(g<Logger>()));
  g.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSource(g<SharedPreferences>()));
  g.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(g<ApiClient>()));
  g.registerLazySingleton<LoginRepository>(() => LoginRepository(
        g<LoginLocalDataSource>(),
        g<LoginRemoteDataSource>(),
        g<NetworkInfo>(),
      ));
  g.registerLazySingleton<Alerts>(
      () => Alerts(g<AlertsHelper>(), g<FlushbarHelper>()));
  g.registerLazySingleton<AppController>(
      () => AppController(g<AppRepository>()));
  g.registerLazySingleton<AppStore>(
      () => AppStore(g<AppController>(), g<Alerts>()));
  g.registerLazySingleton<DashBoardStore>(
      () => DashBoardStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<GymPanelStore>(
      () => GymPanelStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<GymStore>(
      () => GymStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<LocationStore>(
      () => LocationStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<LoginController>(
      () => LoginController(g<LoginRepository>()));
  g.registerLazySingleton<LoginStore>(
      () => LoginStore(g<LoginController>(), g<Alerts>()));
  g.registerLazySingleton<PaymentStore>(
      () => PaymentStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<PhotoStore>(
      () => PhotoStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<RoutineStore>(
      () => RoutineStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<SearchStore>(
      () => SearchStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<TodoStore>(
      () => TodoStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<TrainerPanelStore>(
      () => TrainerPanelStore(g<ApiClient>(), g<Alerts>()));
  g.registerLazySingleton<TrainerStore>(
      () => TrainerStore(g<ApiClient>(), g<Alerts>()));
}

class _$NetworkInfoDi extends NetworkInfoDi {}

class _$DioDi extends DioDi {}

class _$LoggerDi extends LoggerDi {}

class _$SharedPreferencesDi extends SharedPreferencesDi {}
