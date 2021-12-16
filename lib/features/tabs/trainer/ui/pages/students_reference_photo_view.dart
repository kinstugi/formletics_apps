import 'package:flutter/material.dart';
import 'package:formletics/features/tabs/trainer/data/models/student_reference_photo_model.dart';
import 'package:formletics/features/tabs/trainer/ui/widgets/before_and_after.dart';


class StudentsReferencePhotoView extends StatelessWidget {
  final List<StudentReferencePhotoModel> images;

  const StudentsReferencePhotoView({@required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemCount: images?.length,
        itemBuilder: (ctx, i){
          return BeforeAfterImage(
            beforeImage: images[i].beforeImage,
            afterImage: images[i].afterImage,
          );
        }
      ),
    );
  }
}
