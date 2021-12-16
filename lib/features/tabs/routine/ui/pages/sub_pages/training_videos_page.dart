import 'package:flutter/material.dart';
import '../../widgets/trainer_video_widget.dart';

class TrainerVideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainer Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TrainerVideoWidget(),
          ],
        ),
      ),
    );
  }
}
