import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/widgets/text_field/custom_rouded_text_field.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/models/route_redirect_model.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/widget_extends/sf_widget.dart';
import 'package:provider/provider.dart';

class GymRegisterScreen extends StatefulWidget {
  final String redirectRouteName;
  final Object redirectRouteArgs;

  const GymRegisterScreen({
    Key key,
    this.redirectRouteName,
    this.redirectRouteArgs,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GymRegisterScreenState(
        redirectOnLogin: RouteRedirectModel(
          routeName: redirectRouteName,
          arguments: redirectRouteArgs,
        ),
      );
}

class _GymRegisterScreenState extends SfWidget<GymRegisterScreen> {
  final RouteRedirectModel redirectOnLogin;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _phoneFocus = FocusNode();
  String ilValue = 'İl';
  String ilceValue = 'İlçe';
  String semtValue = 'Semt';
  String mahalleValue = 'Mahalle';

  _GymRegisterScreenState({
    this.redirectOnLogin,
  });

  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;

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
        physics: const AlwaysScrollableScrollPhysics(),
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
                  height: size.height * 0.10,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                Column(children: <Widget>[
                  SizedBox(height: size.height * .02),
                  Container(
                    height: size.height * 0.75,
                    width: size.width * 0.85,
                    child: ListView(
                      children: [
                        Column(
                          children: <Widget>[
                            Center(
                                child: Text(
                              ln(context, 'gym_registration_form'),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500
                              ),
                            ),),
                            SizedBox(height: size.height * .02),
                            _namesurname(size),
                            SizedBox(height: size.height * .02),
                            _phone(size),
                            SizedBox(height: size.height * .02),
                            _username(size),
                            SizedBox(height: size.height * .02),
                            _password(size),
                            SizedBox(height: size.height * .02),
                            _password(size),
                            SizedBox(height: size.height * .02),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryColor
                                            .withOpacity(0.5),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(22),
                                      ),
                                    ),
                                    color: Colors.black.withOpacity(0.75),
                                    child: Container(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: size.width * .65,
                                            maxHeight: size.width * .1),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: ln(context, 'select'),
                                            isDense: true,
                                            hintStyle: TextStyle(
                                                color: AppColors.white
                                                    .withOpacity(0.5),
                                                fontSize: 14),
                                            fillColor: AppColors.searchBoxColor,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  InkWell(
                                    onTap: () {},
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      color: AppColors.dosyaColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * .02),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * .4,
                                          maxHeight: size.width * .15),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(22),
                                          ),
                                        ),
                                        color: Colors.black.withOpacity(0.75),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          constraints: BoxConstraints(
                                            maxHeight: size.width * .2,
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            isExpanded: true,
                                            value: ilValue,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconEnabledColor: AppColors.white,
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                              color: AppColors.white,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                ilValue = newValue;
                                              });
                                            },
                                            items: <String>[
                                              ln(context, 'city'),
                                              'Zürafa',
                                              'Hamsi',
                                              'Maymun'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * .4,
                                          maxHeight: size.width * .15),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(22),
                                          ),
                                        ),
                                        color: Colors.black.withOpacity(0.75),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          constraints: BoxConstraints(
                                            maxHeight: size.width * .2,
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            isExpanded: true,
                                            value: ilceValue,
                                            icon: const Icon(Icons.arrow_drop_down),
                                            iconEnabledColor: AppColors.white,
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                              color: AppColors.white,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                ilceValue = newValue;
                                              });
                                            },
                                            items: <String>[
                                              ln(context, 'county'),
                                              'Zürafa',
                                              'Hamsi',
                                              'Maymun'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(height: size.width * .03),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * .4,
                                          maxHeight: size.width * .15),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(22),
                                          ),
                                        ),
                                        color: Colors.black.withOpacity(0.75),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          constraints: BoxConstraints(
                                            maxHeight: size.width * .2,
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            isExpanded: true,
                                            value: semtValue,
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                            ),
                                            iconEnabledColor: AppColors.white,
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                              color: AppColors.white,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                semtValue = newValue;
                                              });
                                            },
                                            items: <String>[
                                              ln(context, 'district'),
                                              'Zürafa',
                                              'Hamsi',
                                              'Maymun'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * .4,
                                          maxHeight: size.width * .15),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(22),
                                          ),
                                        ),
                                        color: Colors.black.withOpacity(0.75),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          constraints: BoxConstraints(
                                            maxHeight: size.width * .2,
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            isExpanded: true,
                                            value: mahalleValue,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconEnabledColor: AppColors.white,
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                              color: AppColors.white,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                mahalleValue = newValue;
                                              });
                                            },
                                            items: <String>[
                                              ln(context, 'neighbourhood'),
                                              'Zürafa',
                                              'Hamsi',
                                              'Maymun'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(height: size.width * .03),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: _signUpButton(size),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ])
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
        )
      ],
    );
  }

  Widget _phone(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextField(
          hint: ln(context, 'phone_number'),
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: ln(context, 'phone_number_error'),
          textEditingController: _phoneController,
          currentFocusNode: _phoneFocus,
          isFocused: false,
        )
      ],
    );
  }

  Widget _namesurname(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextField(
          hint: ln(context, 'name_surname'),
          obscureText: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          errorText: ln(context, 'email_error'),
          textEditingController: _usernameController,
          currentFocusNode: _usernameFocus,
          isFocused: false,
        )
      ],
    );
  }

  Widget _signUpButton(Size size) {
    return Container(
        width: size.width,
        height: kBottomNavigationBarHeight,
        child: RaisedButton(
          onPressed: () {},
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Text(ln(context, 'register')),
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
                  }
                ),
          ],
        ),
      ),
    );
  }
}
