import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/data/models/post_register_request_model.dart';
import 'package:formletics/features/login/ui/validators/validator.dart';
import 'package:formletics/widgets/text_field/custom_rouded_text_field.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/models/route_redirect_model.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  final String redirectRouteName;
  final Object redirectRouteArgs;

  const RegisterScreen({
    Key key,
    this.redirectRouteName,
    this.redirectRouteArgs,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenState(
        redirectOnLogin: RouteRedirectModel(
          routeName: redirectRouteName,
          arguments: redirectRouteArgs,
        ),
      );
}

class _RegisterScreenState extends SfWidget<RegisterScreen> {
  final RouteRedirectModel redirectOnLogin;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  _RegisterScreenState({
    this.redirectOnLogin,
  });

  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.85,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  ln(context, 'registration_form'),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                                SizedBox(height: size.height * .05),
                                _email(size),
                                SizedBox(height: size.height * .04),
                                _username(size),
                                SizedBox(height: size.height * .04),
                                _password(size),
                                SizedBox(height: size.height * .04),
                                _submitButton(size),
                                SizedBox(height: size.height * .03),
                                Divider(
                                  color: Colors.white,
                                  thickness: size.height * .0009,
                                  indent: size.width * .09,
                                  endIndent: size.width * .09,
                                ),
                                SizedBox(height: size.height * .03),
                                _loginButton(size),
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

  Widget _email(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextField(
          hint: ln(context, 'email_address'),
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: ln(context, 'email_error'),
          textEditingController: _emailController,
          currentFocusNode: _emailFocus,
          isFocused: false,
          validator: emailValidator,
        )
      ],
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
            final bool isFormValid = _formKey.currentState.validate();

            if (isFormValid) {
              final PostRegisterRequestModel params = PostRegisterRequestModel(
                  password: _passwordController.value.text,
                  username: _usernameController.value.text,
                  email: _emailController.value.text);
              _loginStore.doRegistration(context, params);
            }
          },
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Text(ln(context, 'register')
              // style: AppTextStyles.getMediumText(
              //     size.width, AppColors.white, FontConstant.kSemiBold),
              ),
        ));
  }

  Widget _loginButton(Size size) {
    return Container(
        width: size.width,
        height: kBottomNavigationBarHeight,
        // child: BlocListener<LoginBloc, LoginState>(
        //   listener: (context, state) {
        //     // TODO
        //   },
        child:
            //BlocBuilder<LoginBloc, LoginState>(
            //  builder: (context, state) {
            // if (state is AuthenticationLoading) {
            //   return Helper.progressWidget(progressKey);
            // } else {
            // return
            RaisedButton(
          onPressed: () {
            navigateToLogin(context);
          },
          color: const Color.fromRGBO(0, 0, 0, 0.75),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            ln(context, 'login'),
            // style: AppTextStyles.getMediumText(
            //     size.width, AppColors.white, FontConstant.kSemiBold),
          ),
        )
        //  }
        //},
        );
    //),
    //);
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
                  }),
          ],
        ),
      ),
    );
  }
}
