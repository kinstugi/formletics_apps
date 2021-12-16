import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
// import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/request/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class ServiceForm extends StatefulWidget {
  final bool isUpdate;
  final TrainerPanelServiceResponseModel model;

  const ServiceForm({this.isUpdate = false, this.model});

  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
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
    if (widget.isUpdate){
      _nameController.text = widget.model?.name ?? '';
      _price2Controller.text = widget.model?.price_for_2_months.toString() ?? '';
      _price3Controller.text = widget.model?.price_for_3_months.toString() ?? '';
      _price6Controller.text = widget.model?.price_for_6_months.toString() ?? '';
      _price12Controller.text = widget.model?.price_for_12_months.toString() ?? '';
      _descriptionController.text = widget.model?.description ?? '';
      egzersizValue = widget.model?.is_exercise ?? false;
      besinValue = widget.model?.is_nutrition ?? false;
      takviyeValue = widget.model?.is_supplement ?? false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: Text(
            ln(context, 'service_name'),
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
              hintText: ln(context, 'pls_add_service_name'),
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
                    style: BorderStyle.none
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
          width: double.infinity,
          child: Text(
            ln(context, 'price_2_months'),
            style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
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
              hintText: ln(context, 'total_price_2_months'),
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
                    color: AppColors.primaryColor),
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
          width: double.infinity,
          child: Text(
            ln(context, 'price_3_months'),
            style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
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
              hintText: ln(context, 'total_price_3_months'),
              isDense: true,
              hintStyle: TextStyle(
                  color: AppColors.white.withOpacity(0.5),
                  fontSize: 14),
              fillColor: AppColors.searchBoxColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                const BorderSide(width: 0, style: BorderStyle.none),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: AppColors.primaryColor),
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
          width: double.infinity,
          child: Text(
            ln(context, 'price_6_months'),
            style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
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
              hintText: ln(context, 'total_price_6_months'),
              isDense: true,
              hintStyle: TextStyle(
                  color: AppColors.white.withOpacity(0.5),
                  fontSize: 14),
              fillColor: AppColors.searchBoxColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                BorderSide(width: 0, style: BorderStyle.none),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: AppColors.primaryColor),
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
          width: double.infinity,
          child: Text(
            ln(context, 'price_12_months'),
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
            controller: _price12Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: ln(context, 'total_price_12_months'),
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
                    color: AppColors.primaryColor),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: CheckboxListTile(
              title: Text(
                ln(context, 'exercise_included'),
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              value: egzersizValue,
              onChanged: (newValue) {
                setState(() {
                  egzersizValue = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity
                  .leading, //  <-- leading Checkbox
            ),
          ),
        ),
        Container(
          child: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: CheckboxListTile(
              title: Text(
                ln(context, 'nutrient_included'),
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              value: besinValue,
              onChanged: (newValue) {
                setState(() {
                  besinValue = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity
                  .leading, //  <-- leading Checkbox
            ),
          ),
        ),
        Container(
          child: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: CheckboxListTile(
              title: Text(
                ln(context, 'supplement_included'),
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              value: takviyeValue,
              onChanged: (newValue) {
                setState(() {
                  takviyeValue = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity
                  .leading, //  <-- leading Checkbox
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: Text(
            ln(context, 'description'),
            style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: _descriptionController,
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: ln(context, 'add_description'),
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
                    style: BorderStyle.none
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: AppColors.primaryColor),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        MultiProvider(
          providers: [
            Provider<TrainerPanelStore>(
                create: (_) => _trainerPanelStore),
          ],
          child: Observer(
            builder: (_) {
              if (_trainerPanelStore
                  .isSucceedPostService4TrainerPanel ==
                  StateStatus.SUCCESS) {
                return Loading();
              } else {
                return RaisedButton(
                  onPressed: () {
                    if(widget.isUpdate){
                      _updateService();
                    }else{
                      _createNewService();
                    }
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(ln(context, 'save_service')),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  TrainerPanelServiceRequestModel _saveForm(){
    String name = _nameController.text;
    int price2 = 0;
    int price3 = 0;
    int price6 = 0;
    int price12 = 0;
    if (_price2Controller.text.isNotEmpty) {
      price2 = int.parse(_price2Controller.text);
    }
    if (_price3Controller.text.isNotEmpty) {
      price3 = int.parse(_price3Controller.text);
    }
    if (_price6Controller.text.isNotEmpty) {
      price6 = int.parse(_price6Controller.text);
    }
    if (_price12Controller.text.isNotEmpty) {
      price12 = int.parse(_price12Controller.text);
    }
    final String desc = _descriptionController.text;
    final TrainerPanelServiceRequestModel _postContent =
    TrainerPanelServiceRequestModel(
      subscription: false,
      name: name,
      price_for_2_months: price2,
      price_for_3_months: price3,
      price_for_6_months: price6,
      price_for_12_months: price12,
      description: desc,
      is_exercise: egzersizValue,
      is_nutrition: besinValue,
      is_supplement: takviyeValue,
    );
    return _postContent;
  }

  Future<void> _createNewService() async{
    final TrainerPanelServiceRequestModel _postContent = _saveForm();
    await _trainerPanelStore.postService4TrainerPanel(_postContent);

    if (_trainerPanelStore
        .isSucceedPostService4TrainerPanel ==
        StateStatus.SUCCESS) {
      //_alerts.setAlert(context, 'Eklendi reis!');
      _flash.successBar(context,
          message: ln(
              context, 'success_message_add_service'));

      Navigator.of(context).pop(true);
    } else {
      _flash.errorBar(context,
          message:
          ln(context, 'fail_message_add_service'));
      Navigator.of(context).pop(false);
    }
  }

  Future<void> _updateService() async{
    final TrainerPanelServiceRequestModel _enteredContent = _saveForm();
    String _period = widget.model.period;
    if(widget.model.period.isEmpty){
      _period = "test"; //TODO remove this
    }
    final TrainerPanelServiceResponseModel _postContent =
    TrainerPanelServiceResponseModel(
      description: _enteredContent.description,
      id: widget.model.id,
      is_exercise: _enteredContent.is_exercise,
      is_nutrition: _enteredContent.is_nutrition,
      is_supplement: _enteredContent.is_supplement,
      name: _enteredContent.name,
      period: _period,
      price_for_2_months: _enteredContent.price_for_2_months,
      price_for_3_months: _enteredContent.price_for_3_months,
      price_for_6_months: _enteredContent.price_for_6_months,
      price_for_12_months: _enteredContent.price_for_12_months,
      trainer: widget.model.trainer
    );

    await _trainerPanelStore.updateService4TrainerPanel(
        _postContent,
        widget.model.id
    );

    if (_trainerPanelStore
        .isSucceedUpdateService ==
        StateStatus.SUCCESS) {
      //_alerts.setAlert(context, 'Eklendi reis!');
      _flash.successBar(context, message: ln(context, 'success_message_add_service'));

      Navigator.of(context).pop(true);
    } else {
      _flash.errorBar(context, message: ln(context, 'fail_message_add_service'));
      Navigator.of(context).pop(false);
    }
  }
}
