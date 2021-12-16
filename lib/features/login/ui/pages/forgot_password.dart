import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/helpers/flash_helper.dart';
// import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
// import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/login/ui/validators/validator.dart';
import 'package:formletics/widgets/text_field/custom_rouded_text_field.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/models/route_redirect_model.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends SfWidget<ForgotPasswordScreen> {
  final RouteRedirectModel redirectOnLogin;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  FlashHelper _flash;

  _ForgotPasswordScreenState({
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
                                        ln(context, 'psw_reset'),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )
                                  ),
                                  SizedBox(height: size.height * .05),
                                  _username(size),
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
                                  _lostPass()
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
        ));
  }

  Widget _username(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextField(
          hint: ln(context, 'email_address'),
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: ln(context, 'user_name_error'),
          textEditingController: _usernameController,
          currentFocusNode: _usernameFocus,
          isFocused: false,
          validator: usernameValidator,
          // isFocused: loginUserDetails.username != null &&
          //         loginUserDetails.username.isNotEmpty
          //     ? true
          //     : false,
          // validator: (_) {
          //   return (loginUserDetails.username == null ||
          //               loginUserDetails.username.isEmpty) ||
          //           loginState.isEmailValid
          //       ? null
          //       : StringConstant.invalid_user_name;
          // },
        )
      ],
    );
  }


  Widget _submitButton(Size size) {
    return Container(
      width: size.width,
      height: kBottomNavigationBarHeight,
      child:

      RaisedButton(
        onPressed: () {
          final isFormValid = _formKey.currentState.validate();

          if(isFormValid){
            final username = _usernameController.value.text;
            final password = _passwordController.value.text;
            final PostLoginRequestModel params = PostLoginRequestModel(
                username: username,
                password: password
            );
            _loginStore.doLogin(context, params);
          }
        },
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),

        child: Text(
            ln(context, 'psw_reset')
          // style: AppTextStyles.getMediumText(
          //     size.width, AppColors.white, FontConstant.kSemiBold),
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
                text: ln(context, 'back'),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                  Navigator.of(context).pop();
                }
            ),
          ],
        ),
      ),
    );
  }

}
