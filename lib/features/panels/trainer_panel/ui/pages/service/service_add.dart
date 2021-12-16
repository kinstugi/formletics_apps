import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:formletics/common/di/di.dart';
// import 'package:formletics/common/enums/state_status.dart';
// import 'package:formletics/common/helpers/flash_helper.dart';
// import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
// import 'package:formletics/common/themes/app_colors.dart';
// import 'package:formletics/features/panels/trainer_panel/data/models/service/request/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
import 'package:formletics/features/panels/trainer_panel/ui/pages/service/service_form.dart';
// import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
// import 'package:formletics/features/panels/trainer_panel/ui/store/trainer_panel_store.dart';
// import 'package:formletics/utils/alerts/alerts.dart';
// import 'package:formletics/widget_extends/sf_widget.dart';
// import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:provider/provider.dart';

class TrainerPanelServiceAddWidget extends StatelessWidget {
  final TrainerPanelServiceResponseModel model;

  const TrainerPanelServiceAddWidget({
    Key key,
    this.model
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = model != null;

    return Scaffold(
      appBar: GFAppBar(
        title: Text(ln(context, 'add_new_service'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: isUpdate ? ServiceForm(
          model: model,
          isUpdate: true,
        ) : const ServiceForm(),
      ),
    );
  }
}


// class TrainerPanelServiceAddWidget extends StatefulWidget {
//   const TrainerPanelServiceAddWidget({
//     Key key,
//     TrainerPanelServiceResponseModel model
//   }) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _TrainerPanelServiceAddWidgetState();
// }

// class _TrainerPanelServiceAddWidgetState extends SfWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: GFAppBar(
//           title: Text(ln(context, 'add_new_service'),
//             textAlign: TextAlign.left,
//             style: const TextStyle(fontSize: 14),
//           ),
//       ),
//       body: SingleChildScrollView(
//         child: ServiceForm(),
//       ),
//     );
//   }
//
// }
