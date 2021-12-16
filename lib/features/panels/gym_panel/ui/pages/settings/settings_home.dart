import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/location/data/models/location_response_model.dart';
import 'package:formletics/features/location/ui/store/location_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class GymPanelSettingHomeWidget extends StatefulWidget {
  @override
  _GymPanelSettingHomeWidgetState createState() =>
      _GymPanelSettingHomeWidgetState();
}

class _GymPanelSettingHomeWidgetState extends State<GymPanelSettingHomeWidget> {
  final _emailController = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();

  LocationResponseModel ilValue;
  LocationResponseModel ilceValue;
  LocationResponseModel semtValue;
  LocationResponseModel mahalleValue;

  LocationStore _locationStore = getIt<LocationStore>();
  @override
  void didChangeDependencies() {
    _locationStore ??= Provider.of<LocationStore>(context);

    if (_locationStore.isSucceedIl != StateStatus.SUCCESS) {
      _locationStore.getIl();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
          title: Text(ln(context, 'settings'),
              textAlign: TextAlign.left, style: TextStyle(fontSize: 14))),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: ln(context, 'gym_name'),
                    isDense: true,
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 14),
                    fillColor: AppColors.searchBoxColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
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
              SizedBox(height: size.height * .03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                constraints: BoxConstraints(
                  maxHeight: size.width * .2,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: ln(context, 'phone_number'),
                    isDense: true,
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 14),
                    fillColor: AppColors.searchBoxColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
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
              SizedBox(height: size.height * .03),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                constraints: BoxConstraints(
                    maxHeight: size.width * .2, maxWidth: size.width * 0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: size.width * .75,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: ln(context, 'select'),
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
                                style: BorderStyle.solid,
                                width: 1,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: size.width * .2,
                        ),
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: AppColors.dosyaColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  ln(context, 'file'),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * .03),
              MultiProvider(
                providers: [
                  Provider<LocationStore>(create: (_) => _locationStore),
                ],
                child: Observer(
                  builder: (context) {
                    if (_locationStore.isSucceedIl == StateStatus.SUCCESS) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        constraints: BoxConstraints(
                          maxHeight: size.width * .2,
                        ),
                        child: Card(
                          color: AppColors.searchBoxColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            constraints: BoxConstraints(
                              maxHeight: size.width * .1,
                              maxWidth: size.width * .4,
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              dropdownColor: AppColors.dropdownColor,
                              value: ilValue,
                              hint: Text(ln(context, 'select')),
                              elevation: 16,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.white.withOpacity(0.5),
                              ),
                              onChanged: (LocationResponseModel val) {
                                setState(() {
                                  ilValue = val;
                                  ilceValue = null;
                                  _locationStore.getIlce(ilValue.id);
                                });
                              },
                              items: _locationStore.ilList.map((value0) {
                                return DropdownMenuItem<LocationResponseModel>(
                                  value: value0,
                                  child: Text(value0.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 0,
                        height: 0,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: size.width * .03),
              MultiProvider(
                providers: [
                  Provider<LocationStore>(create: (_) => _locationStore),
                ],
                child: Observer(
                  builder: (context) {
                    if (_locationStore.isSucceedIl == StateStatus.SUCCESS) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        constraints: BoxConstraints(
                          maxHeight: size.width * .2,
                        ),
                        child: Card(
                          color: AppColors.searchBoxColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            constraints: BoxConstraints(
                              maxHeight: size.width * .1,
                              maxWidth: size.width * .4,
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              dropdownColor: AppColors.dropdownColor,
                              value: ilceValue,
                              hint: Text(ln(context, 'select')),
                              elevation: 16,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.white.withOpacity(0.5),
                              ),
                              onChanged: (LocationResponseModel val) {
                                setState(() {
                                  ilceValue = val;
                                  semtValue = null;
                                  _locationStore.getSemt(ilceValue.id);
                                });
                              },
                              items: _locationStore.ilceList.map((value0) {
                                return DropdownMenuItem<LocationResponseModel>(
                                  value: value0,
                                  child: Text(value0.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 0,
                        height: 0,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: size.width * .03),
              MultiProvider(
                providers: [
                  Provider<LocationStore>(create: (_) => _locationStore),
                ],
                child: Observer(
                  builder: (context) {
                    if (_locationStore.isSucceedIl == StateStatus.SUCCESS) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        constraints: BoxConstraints(
                          maxHeight: size.width * .2,
                        ),
                        child: Card(
                          color: AppColors.searchBoxColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            constraints: BoxConstraints(
                              maxHeight: size.width * .1,
                              maxWidth: size.width * .4,
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              dropdownColor: AppColors.dropdownColor,
                              value: semtValue,
                              hint: Text(ln(context, 'select')),
                              elevation: 16,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.white.withOpacity(0.5),
                              ),
                              onChanged: (LocationResponseModel val) {
                                setState(() {
                                  semtValue = val;
                                  mahalleValue = null;
                                  _locationStore.getMahalle(semtValue.id);
                                });
                              },
                              items: _locationStore.semtList.map((value0) {
                                return DropdownMenuItem<LocationResponseModel>(
                                  value: value0,
                                  child: Text(value0.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Loading();
                    }
                  },
                ),
              ),
              SizedBox(height: size.width * .03),
              MultiProvider(
                providers: [
                  Provider<LocationStore>(create: (_) => _locationStore),
                ],
                child: Observer(
                  builder: (context) {
                    if (_locationStore.isSucceedIl == StateStatus.SUCCESS) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        constraints: BoxConstraints(
                          maxHeight: size.width * .2,
                        ),
                        child: Card(
                          color: AppColors.searchBoxColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            constraints: BoxConstraints(
                              maxHeight: size.width * .1,
                              maxWidth: size.width * .4,
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              dropdownColor: AppColors.dropdownColor,
                              value: mahalleValue,
                              hint: Text(ln(context, 'select')),
                              elevation: 16,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.white.withOpacity(0.5),
                              ),
                              onChanged: (LocationResponseModel val) {
                                setState(() {
                                  mahalleValue = val;
                                });
                              },
                              items: _locationStore.mahalleList.map((value0) {
                                return DropdownMenuItem<LocationResponseModel>(
                                  value: value0,
                                  child: Text(value0.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 0,
                        height: 0,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: size.width * .03),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                constraints: BoxConstraints(
                  maxHeight: size.width * .2,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: RaisedButton(
                    onPressed: () {
                      //_showMyDialog();
                    },
                    color: Color.fromRGBO(0, 0, 0, 0.75),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Devam et ticari",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
