import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/training_videos_page.dart';

class ProgramTile extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const ProgramTile({
    Key key,
    @required this.title,
    @required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Card(
        elevation: 2,
        color: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return Container(
                    height: 300,
                    child: ListView.separated(
                      separatorBuilder: (ctx, i) => const Divider(),
                      itemCount: 30,
                      itemBuilder: (ctx, i) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => TrainerVideosPage(),
                            ));
                          },
                          title: Text('day ${i + 1}'),
                          trailing: Checkbox(
                            onChanged: (val) {},
                            value: DateTime.now().day > i + 1,
                          ),
                        );
                      },
                    ),
                  );
                });
          },
          leading: Chip(
            backgroundColor: Colors.blueAccent,
            label: const Icon(FontAwesomeIcons.running),
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          title: Text(title),
          trailing: FlatButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.bolt,
              color: Colors.blueAccent,
            ),
            label: const Text("şimdi calış"),
          ),
        ),
      );
    }
    return Card(
      elevation: 2,
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {},
        leading: Chip(
          label: const Icon(FontAwesomeIcons.running),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        title: Text(title),
        trailing: FlatButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.rotate_right),
          label: const Text("Tekrar"),
        ),
      ),
    );
  }
}
