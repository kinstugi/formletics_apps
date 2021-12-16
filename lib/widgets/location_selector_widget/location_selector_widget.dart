import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/location/data/models/location_response_model.dart';
import 'package:formletics/features/location/ui/store/location_store.dart';
import 'package:formletics/features/tabs/gym/ui/store/my_gym_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class LocationSelectorPanel extends StatefulWidget {
  final MyGymStore store;

  const LocationSelectorPanel({this.store});

  @override
  _LocationSelectorPanelState createState() =>
      _LocationSelectorPanelState();
}

class _LocationSelectorPanelState extends State<LocationSelectorPanel> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();

  LocationResponseModel ilValue;
  LocationResponseModel ilceValue;
  LocationResponseModel semtValue;
  LocationResponseModel mahalleValue;

  LocationStore _locationStore = getIt<LocationStore>();
  MyGymStore _store;

  @override
  void initState() {
    _store = widget.store;
    super.initState();
  }

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
      // appBar: GFAppBar(
      //   title: Text(
      //     ln(context, 'settings'),
      //     textAlign: TextAlign.left,
      //     style: const TextStyle(fontSize: 14),
      //   ),
      // ),
      body: SafeArea(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(left:16.0),
                  child: Text(
                    'Location Data',
                    style: Theme.of(context).textTheme.headline3.copyWith(),
                  ),
                ),
                SizedBox(height: size.height * .03),
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
                                    semtValue = null;
                                    mahalleValue = null;
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
                                    mahalleValue = null;
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
                SizedBox(height: size.width * .01),
                const Padding(
                  padding: EdgeInsets.only(left:16.0),
                  child: Text(
                    "Select at least the province in which you're "
                        "currently located",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white30
                    ),
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
                        _saveLocationData();
                      },
                      color:  Colors.black.withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "kaydet",
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
      ),
    );
  }

  Future<void> _saveLocationData() async{
    final Map<String, dynamic> data = {
      "il" : {
        'id': ilValue?.id,
        "name": ilValue?.name
      },
      "ilce" : {
        'id': ilceValue?.id,
        'name': ilceValue?.name
      },
      "semt": {
        'id' : semtValue?.id,
        'name': semtValue?.name
      },
      'mahalle': {
        'id': mahalleValue?.id,
        'name': mahalleValue?.name
      }
    };
    await _store.saveFilter(data);
    Navigator.of(context).pop();
  }
}
