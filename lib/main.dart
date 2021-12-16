import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formletics/common/di/di.dart' as di;
import 'package:formletics/constants/env.dart';
import 'package:formletics/features/app/ui/pages/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]);

  Env.init();

  await di.init();

  runApp(App());
}
