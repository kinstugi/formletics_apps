import 'package:flutter/material.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/progress_photo_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/sportsman/photo_detail_screen.dart';

class TrainerProgressPhotoWidget extends StatelessWidget {
  final int position;
  final ProgressPhotoUploadResponseModel responseModel;

  const TrainerProgressPhotoWidget({
    this.responseModel,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = responseModel.photos.map((e) => e.image).toList();

    return Card(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(1),
        ),
      ),
      elevation: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionTile(
            title: Text(
              '$position. AY',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            children: [
              ListTile(
                title: const Text('Biceps'),
                trailing: Chip(
                  label: Text(responseModel.biceps.toString()),
                ),
              ),
              ListTile(
                title: const Text('Triceps'),
                trailing: Chip(
                  label: Text(responseModel.triceps.toString()),
                ),
              ),
              ListTile(
                title: const Text('Chest'),
                trailing: Chip(
                  label: Text(responseModel.chest.toString()),
                ),
              ),
              ListTile(
                title: const Text('Shoulders'),
                trailing: Chip(
                  label: Text(responseModel.shoulder.toString()),
                ),
              ),
              ListTile(
                title: const Text('Height'),
                trailing: Chip(
                  label: Text(responseModel.height.toString()),
                ),
              ),
              ListTile(
                title: const Text('Weight'),
                trailing: Chip(
                  label: Text(responseModel.weight.toString()),
                ),
              ),
            ],
          ),
          const Divider(height: 1.0),
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
                          imageList: imageList,
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
      ),
    );
  }
}
