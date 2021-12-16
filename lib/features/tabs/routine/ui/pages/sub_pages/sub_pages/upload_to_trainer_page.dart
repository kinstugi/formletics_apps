import 'package:flutter/material.dart';
import 'package:formletics/features/tabs/routine/data/models/service_response_model.dart';
import '../../../widgets/student_photo_upload_widget.dart';

class UploadPhotoToTrainer extends StatefulWidget {
  final ServiceResponseModel service;

  const UploadPhotoToTrainer({
    this.service,
  });

  @override
  _UploadPhotoToTrainerState createState() => _UploadPhotoToTrainerState();
}

class _UploadPhotoToTrainerState extends State<UploadPhotoToTrainer> {
  DateTime _startDate, _endDate, _now;
  bool _canSet = true;
  final DAYS_IN_MONTH = 30;
  Duration _dt, _dt_now = Duration(seconds: 10);

  @override
  void initState() {
    // TODO: implement initState
    _startDate = DateTime.parse(widget.service.startDate);
    _endDate = DateTime.parse(widget.service.endDate);
    _now = DateTime.now();

    _dt = _endDate.difference(_startDate);
    _dt_now = _now.difference(_startDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.service.name),
      ),
      body: ListView.builder(
        itemCount: widget.service.months,
        itemBuilder: (ctx, i) {
          final _nDate = _startDate.add(Duration(days: 30 * i));
          bool _isActive = false;
          if (_canSet) {
            _isActive = _now.compareTo(_nDate) >= 0;

            if (_isActive) {
              _canSet = false;
            }
          }

          return StudentPhotoUploadWidget(
            label: '${i + 1}. Ay',
            serviceId: widget.service.id,
            isActive: _isActive,
          );
        },
      ),
    );
  }
}
