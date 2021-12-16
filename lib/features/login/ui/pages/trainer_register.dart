import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/data/models/trainer_register_model.dart';
import 'package:image_picker/image_picker.dart';

class TrainerRegisterPage extends StatefulWidget {
  const TrainerRegisterPage({Key key}) : super(key: key);

  @override
  _TrainerRegisterPageState createState() => _TrainerRegisterPageState();
}

class _TrainerRegisterPageState extends State<TrainerRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TrainerRegisterModel _trainerData;

  @override
  void initState() {
    _trainerData = TrainerRegisterModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const _companyTypes = [
      'Personal Taxpayer',
      'Private Company',
      'Limited or Joint Stock Company',
    ];

    return Scaffold(
      backgroundColor: AppColors.darkModeBlack,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login-bg-bl.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: kBottomNavigationBarHeight,
              ),
              Container(
                height: size.height * 0.20,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.username = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Username",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (val) => _trainerData.password = val,
                          onSaved: (val) => _trainerData.password = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Password",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (val) {
                            if (val == _trainerData.password) {
                              return null;
                            }
                            return "Password Must Match";
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.firstName = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Username",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.lastName = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Last Name",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone (595) 44-3322',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.phone = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Phone Number",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.email = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Email",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Specialization',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.email = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Specializaiton",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Professional Statement',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _trainerData.email = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Statement",
                        ),
                        const SizedBox(height: 15),
                        DropdownButtonFormField(
                          hint: const Text('Your Company Type'),
                          items: _companyTypes.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (val) {
                            _trainerData.companyType = val as String;
                          },
                          validator: (value) {
                            if (value == null) {
                              return "select company type";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        const RegisterImageUpload(label: "Vergi levhası"),
                        const SizedBox(height: 15),
                        const RegisterImageUpload(label: "İmza sirküleri"),
                        const SizedBox(height: 15),
                        const RegisterImageUpload(label: "Banka bilgileri"),
                        const SizedBox(height: 15),
                        const RegisterImageUpload(label: "Faaliyet belgesi"),
                        const SizedBox(height: 15),
                        const RegisterImageUpload(
                            label: "Ticaret Sicil Gazetesi"),
                        const SizedBox(height: 15),
                        const RegisterImageUpload(label: "Formletics Sözleşme"),
                      ],
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => _submitForm(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('REGISTER'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_trainerData.toJson());
    }
  }
}

class RegisterImageUpload extends StatefulWidget {
  const RegisterImageUpload({
    Key key,
    this.label,
  }) : super(key: key);
  final String label;

  @override
  _RegisterImageUploadState createState() => _RegisterImageUploadState();
}

class _RegisterImageUploadState extends State<RegisterImageUpload> {
  final picker = ImagePicker();
  File _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Container(
          child: _image == null
              ? const Text('No image selected')
              : Image.file(
                  _image,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
        ),
        const SizedBox(width: 15),
        RaisedButton(
          onPressed: getImage,
          child: const Text('Select Image'),
        ),
      ],
    );
  }
}
