import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';

class TrainerVideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RaisedButton(
          onPressed: () {},
          color: AppColors.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Eğitmen notu'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Chip(
              label: Text('Sets : 20'),
            ),
            Icon(
              Icons.alarm,
              color: AppColors.primaryColor,
              size: 40,
            ),
            const Chip(
              label: Text('Tekrar : 10'),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          '00:00:00.00',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        const SizedBox(height: 10),
        Image.network(
          'https://www.physeddepot.com/uploads/7/7/9/3/77930806/455645_orig.gif',
          height: size.height * 0.3,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.play_arrow),
            ),
            const SizedBox(width: 10),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: AppColors.primaryColor,
              child: const Icon(Icons.pause),
            ),
            const SizedBox(width: 10),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.redAccent,
              child: const Icon(Icons.rotate_left),
            )
          ],
        )
      ],
    );
  }
}
