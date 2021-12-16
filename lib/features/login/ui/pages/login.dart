import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/ui/pages/forgot_password.dart';
import 'package:formletics/features/login/ui/pages/register.dart';
import 'package:formletics/features/login/ui/pages/root_auth_trainer.dart';
import 'package:formletics/features/login/ui/pages/trainer/trainer_register.dart';
import 'package:formletics/features/login/ui/validators/validator.dart';
import 'package:formletics/widgets/text_field/custom_rouded_text_field.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/models/route_redirect_model.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final String redirectRouteName;
  final Object redirectRouteArgs;
  final bool actualPage;
  final bool proceedToRegister;

  const LoginScreen({
    Key key,
    this.redirectRouteName,
    this.redirectRouteArgs,
    this.actualPage = false,
    this.proceedToRegister = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState(
        redirectOnLogin: RouteRedirectModel(
          routeName: redirectRouteName,
          arguments: redirectRouteArgs,
        ),
      );
}

class _LoginScreenState extends SfWidget<LoginScreen> {
  final RouteRedirectModel redirectOnLogin;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  FlashHelper _flash;

  _LoginScreenState({
    this.redirectOnLogin,
  });

  LoginStore _loginStore;
  List<ReactionDisposer> _disposers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _flash ??= getIt<FlashHelper>();
    _loginStore ??= Provider.of<LoginStore>(context);
    super.didChangeDependencies();
  }

  void doLogin(PostLoginRequestModel param) {
    _loginStore.doLogin(context, param, redirectOnLogin: redirectOnLogin);
  }

  @override
  void dispose() {
    if (_disposers != null) {
      _disposers.map((a) {
        a();
      });
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!widget.actualPage) return RootAuthTrainer();

    if (widget.actualPage && widget.proceedToRegister) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const RegisterScreen(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.darkModeBlack,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login-bg-bl.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
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
                Column(
                  children: <Widget>[
                    SizedBox(height: size.height * .05),
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.85,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  ln(context, 'pls_login'),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
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
                  ],
                ),
              ],
            ),
          ),
        ),
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
            final PostLoginRequestModel params =
                PostLoginRequestModel(username: username, password: password);
            _loginStore.doLogin(context, params);
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
          navigateToRoute(context, Routes.registerScreen);
          return;
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (ctx) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(5),
                content: Text(
                  ln(context, 'register_type'),
                  style: Theme.of(context).textTheme.headline5,
                ),
                actions: [
                  FlatButton(
                    onPressed: () {
                      navigateToRoute(context, Routes.registerScreen);
                    },
                    child: Text(ln(context, 'register')),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const TrainerRegisterPage(),
                        ),
                      );
                    },
                    child: Text(ln(context, 'instructor_sign_up')),
                  ),
                  FlatButton(
                    onPressed: () {
                      navigateToRoute(context, Routes.registerScreen);
                    },
                    child: Text(ln(context, 'gym_sign_up')),
                  )
                ],
              );
            },
          );
        },
        color: const Color.fromRGBO(0, 0, 0, 0.75),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: AppColors.primaryColor),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ForgotPasswordScreen(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
