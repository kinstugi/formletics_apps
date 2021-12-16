import 'dart:io';
import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/data/models/gym_register_model.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class GymRegisterPage extends StatefulWidget {
  const GymRegisterPage({Key key}) : super(key: key);

  @override
  _GymRegisterPageState createState() => _GymRegisterPageState();
}

class _GymRegisterPageState extends State<GymRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  GymRegisterModel _gymData;

  LoginStore _loginStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);
  }

  @override
  void initState() {
    _gymData = GymRegisterModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                          onSaved: (val) => _gymData.username = val,
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
                          onChanged: (val) => _gymData.password = val,
                          onSaved: (val) => _gymData.password = val,
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
                            if (val == _gymData.password) {
                              return null;
                            }
                            return "Password Must Match";
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Gym Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _gymData.name = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Username",
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
                          onSaved: (val) => _gymData.phone = val,
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
                          onSaved: (val) => _gymData.email = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Email",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Mahalle',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _gymData.location = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Mahalle",
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSaved: (val) => _gymData.statement = val,
                          validator: (val) =>
                              val.isNotEmpty ? null : "Enter Statement",
                        ),
                        const SizedBox(height: 15),
                        RegisterImageUpload(
                          label: "Vergi levhası",
                          data: _gymData,
                        ),
                        const SizedBox(height: 15),
                        RegisterImageUpload(
                          label: "İmza sirküleri",
                          data: _gymData,
                        ),
                        const SizedBox(height: 15),
                        RegisterImageUpload(
                          label: "Banka bilgileri",
                          data: _gymData,
                        ),
                        const SizedBox(height: 15),
                        RegisterImageUpload(
                          label: "Faaliyet belgesi",
                          data: _gymData,
                        ),
                        const SizedBox(height: 15),
                        RegisterImageUpload(
                          label: "Ticaret Sicil Gazetesi",
                          data: _gymData,
                        ),
                        const SizedBox(height: 15),
                        RegisterImageUpload(
                          label: "Formletics Sözleşme",
                          data: _gymData,
                        ),
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
      print(_gymData.toJson());

      _loginStore.doGymRegistration(_gymData);
    }
  }
}

class RegisterImageUpload extends StatefulWidget {
  const RegisterImageUpload({
    Key key,
    this.label,
    this.data,
  }) : super(key: key);
  final String label;
  final GymRegisterModel data;

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
        widget.data.setFileField(widget.label.toLowerCase(), _image);
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
