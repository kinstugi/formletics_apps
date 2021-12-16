import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/routine/ui/pages/sub_pages/sub_pages/upload_form_page.dart';

import 'upload_photo_button.dart';

class StudentPhotoUploadWidget extends StatelessWidget {
  final String label;
  final int serviceId;
  final bool isActive;

  const StudentPhotoUploadWidget({
    this.label,
    this.serviceId,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 3,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Card(
          elevation: 2,
          color: AppColors.darkModeBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          margin: EdgeInsets.zero,
          child: ClipPath(
            clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: AppColors.primaryColor,
                    width: 5,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              label,
                              style: TextStyle(
                                color:
                                    isActive ? AppColors.white : Colors.white24,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        UploadPhotoButton(
                          isActive: isActive,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (ctx) {
                                return UploadProgressFormPage(
                                  serviceId: serviceId,
                                );
                              }),
                            );
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
