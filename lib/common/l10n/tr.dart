import 'package:formletics/features/app/ui/l10n/tr.dart';
import 'package:formletics/features/home/ui/l10n/tr.dart';
import 'package:formletics/features/login/ui/l10n/tr.dart';
import 'package:formletics/features/page_not_found/ui/l10n/tr.dart';
import 'package:formletics/features/panels/gym_panel/ui/l10n/tr.dart';
import 'package:formletics/features/panels/trainer_panel/ui/l10n/tr.dart';
import 'package:formletics/features/payment/ui/l10n/tr.dart';
import 'package:formletics/features/tabs/dashboard/ui/l10n/tr.dart';
import 'package:formletics/features/tabs/gym/ui/l10n/tr.dart';
import 'package:formletics/features/tabs/market/ui/l10n/tr.dart';
import 'package:formletics/features/tabs/photo/ui/l10n/tr.dart';
import 'package:formletics/features/tabs/routine/ui/l10n/tr.dart';
import 'package:formletics/features/tabs/trainer/ui/l10n/tr.dart';

final Map<String, String> trLocaleHashMap = {
  ...appTrLocaleHashMap,
  ...loginTrLocaleHashMap,
  ...homeTrLocaleHashMap,
  ...pageNotFoundTrLocaleHashMap,
  ...dashboardTrLocaleHashMap,
  ...panelsTrLocaleHashMap,
  ...trainerPanelTrLocaleHashMap,
  ...paymentTrLocaleHashMap,
  ...gymsTrLocaleHashMap,
  ...marketTrLocaleHashMap,
  ...photoStoreTrLocaleHashMap,
  ...routineTrLocaleHashMap,
  ...trainersTrLocaleHashMap
};
