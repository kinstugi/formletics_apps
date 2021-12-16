import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
// import 'package:formletics/features/home/ui/pages/bok.dart';
// import 'package:formletics/features/login/ui/store/auth_methods.dart';
import 'package:formletics/widgets/auth_buttons/custom_auth_button.dart';
import 'package:formletics/widgets/auth_buttons/logo_text.dart';

class BaseTrainerPage extends StatefulWidget {
  const BaseTrainerPage({Key key, this.stayHere = false}) : super(key: key);
  final bool stayHere;

  @override
  _BaseTrainerPageState createState() => _BaseTrainerPageState();
}

class _BaseTrainerPageState extends State<BaseTrainerPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (! widget.stayHere){
      print(">>>>>>>>>>>>>>><>>>>>>>>");
      print("navigate to the homepage");
    }else{
      print("<<<<<<<<<<<<<<<<<<<<<");
    }
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (ctx)=> const HomeScreen())
    // );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: kBottomNavigationBarHeight),
            const Expanded(child: LogoText()),
            CustomAuthButtom(
              btnText: 'Trainer',
              color: AppColors.primaryColor,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            CustomAuthButtom(
              btnText: 'Become a trainer',
              color: Colors.black.withOpacity(0.75),
              onPressed: () {},
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "User Login",
              ),
            ),
            const SizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}
