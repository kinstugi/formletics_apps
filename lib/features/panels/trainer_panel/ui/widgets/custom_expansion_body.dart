import 'package:flutter/material.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/progress_photo_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/sportsman/photo_detail_screen.dart';

class CustomExpansionBody extends StatelessWidget {
  final ProgressPhotoUploadResponseModel responseModel;

  const CustomExpansionBody({this.responseModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (responseModel.biceps != null)
          ListTile(
            title: const Text('Biceps'),
            trailing: Chip(
              label: Text(responseModel.biceps.toString()),
            ),
          ),
        if (responseModel.triceps != null)
          ListTile(
            title: const Text('Triceps'),
            trailing: Chip(
              label: Text(responseModel.triceps.toString()),
            ),
          ),
        if (responseModel.chest != null)
          ListTile(
            title: const Text('Chest'),
            trailing: Chip(
              label: Text(responseModel.chest.toString()),
            ),
          ),
        if (responseModel.chest != null)
          ListTile(
            title: const Text('Shoulder'),
            trailing: Chip(
              label: Text(responseModel.shoulder.toString()),
            ),
          ),
        if (responseModel.photos.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(2.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: responseModel.photos.length,
            itemBuilder: (ctx, i) {
              final imageUrl = responseModel.photos[i];

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ProgressPhotoDetailPage(
                        imageList:
                            responseModel.photos.map((e) => e.image).toList(),
                        startIndex: i,
                      ),
                    ),
                  );
                },
                child: Image.network(
                  imageUrl.image,
                  fit: BoxFit.cover,
                ),
              );
            },
          )
      ],
    );
  }
}
