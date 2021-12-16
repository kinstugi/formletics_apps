import 'package:flutter/material.dart';

class ChangePasswordAndEmail extends StatefulWidget {
  const ChangePasswordAndEmail({Key key}) : super(key: key);

  @override
  _ChangePasswordAndEmailState createState() => _ChangePasswordAndEmailState();
}

class _ChangePasswordAndEmailState extends State<ChangePasswordAndEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Credentials'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _changePasswordWidget(),
          const SizedBox(height: 20),
          _changeEmailWidget(),
        ],
      ),
    );
  }

  Widget _titleWidget({String title, IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10,
        bottom: 5,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white60,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white60,
                ),
          ),
        ],
      ),
    );
  }

  Widget _changeEmailWidget() {
    return Card(
      elevation: 2,
      child: ListView(
        shrinkWrap: true,
        children: [
          _titleWidget(
            icon: Icons.mail,
            title: "Change Email",
          ),
          const Divider(color: Colors.white70),
          Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
                bottom: 15,
                top: 5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Old Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "New Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Confirm New Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _changePasswordWidget() {
    return Card(
      elevation: 2,
      child: ListView(
        shrinkWrap: true,
        children: [
          _titleWidget(
            icon: Icons.lock,
            title: "Change Password",
          ),
          const Divider(color: Colors.white70),
          Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
                bottom: 15,
                top: 5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Old Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "New Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Confirm New Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
