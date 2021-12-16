import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_service_list.dart';
import 'package:formletics/features/tabs/routine/ui/store/routine_store.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:provider/provider.dart';

class Routine1ServicesWidget extends StatefulWidget {
  final int trainerId;

  const Routine1ServicesWidget({Key key, @required this.trainerId})
      : super(key: key);

  @override
  _Routine1ServicesWidgetState createState() => _Routine1ServicesWidgetState();
}

class _Routine1ServicesWidgetState extends State<Routine1ServicesWidget> {
  final progressKey = GlobalKey();

  RoutineStore _routineStore = getIt<RoutineStore>();

  @override
  void didChangeDependencies() {
    _routineStore ??= Provider.of<RoutineStore>(context);
    if (_routineStore.isSucceedMyServices != StateStatus.SUCCESS) {
      _routineStore.getMyServices(widget.trainerId);
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _routineStore.resetService();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          ln(context, 'services'),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                MultiProvider(
                  providers: [
                    Provider<RoutineStore>(create: (_) => _routineStore),
                  ],
                  child: Observer(
                    builder: (_) {
                      if (_routineStore.isSucceedMyServices ==
                          StateStatus.LOADING) {
                        return Loading();
                      } else {
                        if (_routineStore.myServices.isEmpty) {
                          return Center(
                              child: Text(ln(context, 'no_schedule_yet')));
                        } else {
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: _routineStore.myServices.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ServiceCardWidget(
                                routine_service_list:
                                    _routineStore.myServices[index],
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCardWidget extends StatelessWidget {
  final RoutineServiceListResponseModel routine_service_list;
  const ServiceCardWidget({Key key, this.routine_service_list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 3,
              spreadRadius: 0,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Card(
          color: AppColors.darkModeBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: EdgeInsets.zero,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            onTap: () {
              navigateToRoute(
                context,
                Routes.routine2RoutineWidget,
                routeArgs: Routine2RoutineWidgetArguments(
                  routine: routine_service_list,
                ),
              );
            },
            child: Ink(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 24,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: AppColors.primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        child: Icon(
                          Icons.alarm,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 37,
                    child: Text(
                      routine_service_list.service.name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 85,
                    top: 30,
                    child: Icon(
                      Icons.flash_on,
                      size: 26,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 37,
                    child: Text(
                      ln(context, 'start_work'),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
