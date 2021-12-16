import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/web_panel/change_password_email.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/web_panel/trainer_profile.dart';

class TrainerDrawer extends StatelessWidget {
  final VoidCallback logout;
  const TrainerDrawer({Key key, this.logout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black54),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trainer Panel",
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.chartLine),
            title: const Text('Dashboard'),
            onTap: () {
              navigateToRoute(context, Routes.trainerPanelHomeWidget);
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Page'),
            children: [
              ListTile(
                title: const Text('User'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const ChangePasswordAndEmail(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Trainer'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const TrainerProfileDetails(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Reviews'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(FontAwesomeIcons.running),
            title: const Text('Sportsmen'),
            children: [
              ListTile(
                title: const Text('General'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Routines'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(FontAwesomeIcons.tools),
            title: const Text('Services'),
            children: [
              ListTile(
                title: const Text('General'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Prices'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Period'),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.question),
            title: const Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              logout();
            },
          ),
        ],
      ),
    );
  }
}
