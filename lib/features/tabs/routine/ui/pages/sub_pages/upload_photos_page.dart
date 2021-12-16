import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/features/tabs/routine/ui/store/routine_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// import '../../widgets/student_photo_upload_widget.dart';
import './sub_pages/upload_to_trainer_page.dart';

class UploadPhotosToTrainerPage extends StatefulWidget {
  @override
  _UploadPhotosToTrainerPageState createState() =>
      _UploadPhotosToTrainerPageState();
}

class _UploadPhotosToTrainerPageState extends State<UploadPhotosToTrainerPage> {
  final picker = ImagePicker();
  final RoutineStore _store = getIt<RoutineStore>();

  @override
  void didChangeDependencies() {
    if (_store.isSucceedSportsmanServices != StateStatus.SUCCESS) {
      _store.fetchSportsmanServices();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Progression Photos'),
      ),
      body: MultiProvider(
        providers: [
          Provider<RoutineStore>(
            create: (_) => _store,
          ),
        ],
        child: Observer(
          builder: (_) {
            return ListView.builder(
              itemCount: _store.sportsmanServices.length,
              itemBuilder: (ctx, i) {
                final item = _store.sportsmanServices[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      item.name.substring(0, 2).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.trainer.name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => UploadPhotoToTrainer(
                          service: item,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
