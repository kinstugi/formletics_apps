import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class Routine5SizeWidget extends StatefulWidget {
  const Routine5SizeWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Routine5SizeWidgetState();
}

class _Routine5SizeWidgetState extends SfWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  Alerts _alerts;
  FlashHelper _flash;

  TrainerPanelStore _trainerPanelStore = getIt<TrainerPanelStore>();

  final _nameController = TextEditingController();
  final _price2Controller = TextEditingController();
  final _price3Controller = TextEditingController();
  final _price6Controller = TextEditingController();
  final _price12Controller = TextEditingController();
  final _descriptionController = TextEditingController();
  bool egzersizValue = false;
  bool besinValue = false;
  bool takviyeValue = false;

  @override
  void didChangeDependencies() {
    _alerts ??= getIt<Alerts>();
    _flash ??= getIt<FlashHelper>();
    _trainerPanelStore ??= Provider.of<TrainerPanelStore>(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _trainerPanelStore.resetPostService();
    super.initState();
  }

  void showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
        title: Text(
          ln(context, 'your_size'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'height'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_height'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'weight'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_weight'),
                      isDense: true,
                      hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'shoulder'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price3Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_shoulder'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'breast'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price6Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_breast'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'waist'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price12Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_waist'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'buttocks'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price6Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_buttocks'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'belly'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price6Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_belly'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ln(context, 'arm'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _price6Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: ln(context, 'sample_arm'),
                      isDense: true,
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.5),
                          fontSize: 14),
                      fillColor: AppColors.searchBoxColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _price2Controller.dispose();
    _price3Controller.dispose();
    _price6Controller.dispose();
    _price12Controller.dispose();
    _descriptionController.dispose();
    _trainerPanelStore.resetPostService();
    super.dispose();
  }
}
