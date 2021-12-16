import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/message/message_detail.dart';
import '../../data/models/chat/response/chats_model_response.dart';

class MessageTileWidget extends StatelessWidget {
  final String name;
  final int studentId;
  final String userToken;
  final List<Service> services;

  const MessageTileWidget({
    this.name,
    this.services,
    this.studentId,
    this.userToken,
  });

  @override
  Widget build(BuildContext context) {
    final course = services.map((e) => e.name).join("--");

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Card(
          color: AppColors.darkModeBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Card(
                            margin: EdgeInsets.zero,
                            color: AppColors.messageColor.withOpacity(.6),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 6,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    ln(context, 'sample_message_1'),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      course,
                      style: TextStyle(
                        color: AppColors.subtitleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _openModal(context);
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: AppColors.purple.withOpacity(.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 6,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.search,
                            color: AppColors.white,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            ln(context, 'see'),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
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
        ),
      ),
    );
  }

  Future _openModal(BuildContext context) async {
    final _height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: _height * 0.25,
          child: ListView.builder(
            itemCount: services.length,
            itemBuilder: (ctx, i) {
              final service = services[i];

              return ListTile(
                title: Text(service.name),
                leading: Text('${i + 1}'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => MessageDetailPage(
                        courseId: service.id,
                        targetUserId: studentId,
                        token: userToken,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
