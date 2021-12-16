import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/features/tabs/routine/data/models/progress_photo_upload_model.dart';
import 'package:formletics/features/tabs/routine/data/providers/progress_photo_upload_provider.dart';
import 'package:formletics/features/tabs/routine/ui/widgets/select_form_type_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class UploadProgressFormPage extends StatefulWidget {
  final int serviceId;

  const UploadProgressFormPage({this.serviceId});

  @override
  _UploadProgressFormPageState createState() => _UploadProgressFormPageState();
}

class _UploadProgressFormPageState extends State<UploadProgressFormPage> {
  bool _photoUpload = false;
  FormType _currentFormType = FormType.bodyMeasurement;
  final List<String> _bloodTypes = ['O', 'A', 'B', 'AB'];
  String _selectBloodType, _shoulder, _bodyFat, _chest;
  String _height, _weight, _biceps, _triceps;
  List<Asset> _images = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectBloodType = _bloodTypes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Monthly Progress'),
      ),
      body: Column(
        children: [
          SelectFormTypeWidget(
            formType: _currentFormType,
            onChange: (e) {
              setState(() {
                _currentFormType = e;
                _photoUpload = e == FormType.photoUpload;
              });
            },
          ),
          if (_photoUpload)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Blood Type",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white38,
                            ),
                          ),
                          DropdownButton(
                            hint: const Text('Select blood Type'),
                            value: _selectBloodType,
                            items: _bloodTypes.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (String v) {
                              setState(() {
                                _selectBloodType = v;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'height',
                          prefixIcon: Icon(Icons.height),
                        ),
                        onChanged: (val) => _height = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'weight',
                          prefixIcon: Icon(FontAwesomeIcons.weight),
                        ),
                        onChanged: (val) => _weight = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Chronic Disease',
                          prefixIcon: Icon(FontAwesomeIcons.disease),
                        ),
                        onChanged: (val) => _triceps = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'body fat',
                          prefixIcon: Icon(Icons.mediation),
                        ),
                        onChanged: (val) => _bodyFat = val,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!_photoUpload)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Blood Type",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white38,
                            ),
                          ),
                          DropdownButton(
                            hint: const Text('Select blood Type'),
                            value: _selectBloodType,
                            items: _bloodTypes.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (String v) {
                              setState(() {
                                _selectBloodType = v;
                              });
                            },
                          ),
                        ],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'height',
                          prefixIcon: Icon(Icons.height),
                        ),
                        onChanged: (val) => _height = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'weight',
                          prefixIcon: Icon(FontAwesomeIcons.weight),
                        ),
                        onChanged: (val) => _weight = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'shoulder',
                          prefixIcon: Icon(Icons.set_meal),
                        ),
                        onChanged: (val) => _shoulder = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'chest',
                          prefixIcon: Icon(FontAwesomeIcons.running),
                        ),
                        onChanged: (val) => _chest = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'body fat',
                          prefixIcon: Icon(Icons.mediation),
                        ),
                        onChanged: (val) => _bodyFat = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => _biceps = val,
                        decoration: const InputDecoration(
                          labelText: 'biceps',
                          prefixIcon: Icon(Icons.bike_scooter),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'triceps',
                          prefixIcon: Icon(Icons.pedal_bike),
                        ),
                        onChanged: (val) => _triceps = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Chronic Disease',
                          prefixIcon: Icon(FontAwesomeIcons.disease),
                        ),
                        onChanged: (val) => _triceps = val,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          RaisedButton(
            onPressed: () {
              if (_photoUpload) {
                _loadAssets(context);
              } else {
                _uploadMeasurements();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_photoUpload ? "Upload Photo" : 'Save'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _loadAssets(BuildContext context) async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 7,
        enableCamera: true,
        selectedAssets: _images,
        cupertinoOptions: const CupertinoOptions(
          takePhotoIcon: "chat",
        ),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Formletics",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );

      //TODO upload progress
      final data = ProgressPhotoUploadModel(
        images: resultList,
        service: widget.serviceId,
        bodyFat: _bodyFat.trim(),
        weight: _weight.trim(),
        height: _height.trim(),
        bloodType: _selectBloodType,
      );

      final provider = Provider.of<ProgressPhotoUploadProvider>(
        context,
        listen: false,
      );

      await provider.uploadProgressDetailToTrainer(data);
    } catch (e) {
      error = e.toString();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(error),
        ),
      );
    }

    if (!mounted) return;

    setState(() {
      _images = resultList;
    });
  }

  Future<void> _uploadMeasurements() async {
    final data = ProgressPhotoUploadModel(
      images: [],
      service: widget.serviceId,
      biceps: _biceps.trim(),
      triceps: _triceps.trim(),
      bloodType: _selectBloodType,
      bodyFat: _bodyFat.trim(),
      chest: _chest.trim(),
      shoulder: _shoulder.trim(),
      weight: _weight.trim(),
      height: _height.trim(),
    );
    final provider = Provider.of<ProgressPhotoUploadProvider>(
      context,
      listen: false,
    );

    await provider.uploadProgressDetailToTrainer(data).then((_) {
      Navigator.of(context).pop();
    }).catchError((e) {
      print(e.toString());
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    });
  }
}
