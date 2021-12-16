import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/ui/validators/validator.dart';
import 'package:formletics/widgets/text_field/custom_rouded_text_field.dart';

import 'trainer_register.dart';

class TrainerLoginPage extends StatefulWidget {
  const TrainerLoginPage({Key key}) : super(key: key);

  @override
  _TrainerLoginPageState createState() => _TrainerLoginPageState();
}

class _TrainerLoginPageState extends State<TrainerLoginPage> {
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login-bg-bl.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            ln(context, 'pls_login'),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * .05),
                        _username(size),
                        SizedBox(height: size.height * .05),
                        _password(size),
                        SizedBox(height: size.height * .04),
                        _lostPass(),
                        SizedBox(height: size.height * .03),
                        _submitButton(size),
                        SizedBox(height: size.height * .03),
                        Divider(
                          color: Colors.white,
                          thickness: size.height * .0009,
                          indent: size.width * .09,
                          endIndent: size.width * .09,
                        ),
                        SizedBox(height: size.height * .03),
                        _signUpButton(size)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _username(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextField(
          hint: ln(context, 'user_name'),
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: ln(context, 'user_name_error'),
          textEditingController: _usernameController,
          currentFocusNode: _usernameFocus,
          isFocused: false,
          validator: usernameValidator,
        )
      ],
    );
  }

  Widget _password(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextField(
          hint: ln(context, 'password'),
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          errorText: ln(context, 'password_error'),
          textEditingController: _passwordController,
          currentFocusNode: _passwordFocus,
          isFocused: false,
          validator: passwordValidator,
        )
      ],
    );
  }

  Widget _submitButton(Size size) {
    return Container(
      width: size.width,
      height: kBottomNavigationBarHeight,
      child: RaisedButton(
        onPressed: () {
          final isFormValid = _formKey.currentState.validate();

          if (isFormValid) {
            final username = _usernameController.value.text;
            final password = _passwordController.value.text;
            final PostLoginRequestModel params = PostLoginRequestModel(
              username: username,
              password: password,
            );
          }
        },
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(ln(context, 'login_btn_text')),
      ),
    );
  }

  Widget _signUpButton(Size size) {
    return Container(
      width: size.width,
      height: kBottomNavigationBarHeight,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => const TrainerRegisterPage(),
          ));
        },
        color: const Color.fromRGBO(0, 0, 0, 0.75),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          ln(context, 'register'),
        ),
      ),
    );
  }

  Widget _lostPass() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: ln(context, 'forgot_password'),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //  print('Privacy Policy"');// TODO
                  print("forgot password");
                },
            ),
          ],
        ),
      ),
    );
  }
}
