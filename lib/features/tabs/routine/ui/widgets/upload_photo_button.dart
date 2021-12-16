import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';

class UploadPhotoButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPress;

  const UploadPhotoButton({
    this.isActive = true,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onPress : null,
      child: Row(
        children: [
          Card(
            color:
                isActive ? AppColors.primaryColor : Colors.blueAccent.shade50,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 3),
          Text(
            ln(context, 'upload_photos'),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white30,
            ),
          )
        ],
      ),
    );
  }

  void _showModal(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height * 0.45,
          child: Column(
            children: [],
          ),
        );
      },
    );

    future.then((value) => _closeModal());
  }

  void _closeModal() {
    print("closed");
  }
}
