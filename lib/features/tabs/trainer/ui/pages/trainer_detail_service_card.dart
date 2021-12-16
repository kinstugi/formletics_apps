import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_service_response_model.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_detail.dart';
import 'package:formletics/features/tabs/trainer/ui/store/trainer_store.dart';
import 'package:provider/provider.dart';

class ServiceCardWidget extends StatefulWidget {
  final TrainerServiceResponseModel service;
  final int trainerId;

  const ServiceCardWidget({
    Key key,
    @required this.service,
    @required this.trainerId,
  }) : super(key: key);

  @override
  _ServiceCardWidgetState createState() => _ServiceCardWidgetState();
}

class _ServiceCardWidgetState extends State<ServiceCardWidget> {
  TrainerStore _trainerStore = getIt<TrainerStore>();

  @override
  void didChangeDependencies() {
    _trainerStore ??= Provider.of<TrainerStore>(context);
    super.didChangeDependencies();
  }

  List<RadioModel> priceList = [];

  @override
  void initState() {
    priceList
        .add(RadioModel(true, 2, widget.service.price_for_2_months.toDouble()));
    priceList.add(
        RadioModel(false, 3, widget.service.price_for_3_months.toDouble()));
    priceList.add(
        RadioModel(false, 6, widget.service.price_for_6_months.toDouble()));
    priceList.add(
        RadioModel(false, 12, widget.service.price_for_12_months.toDouble()));
    super.initState();
  }

  @override
  void dispose() {
    _trainerStore.resetDetail();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.45,
      decoration: BoxDecoration(
        color: AppColors.newServiceColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              widget.service.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.greenies.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.service.description != null &&
                      widget.service.description != ""
                  ? widget.service.description
                  : ln(context, 'no_description_yet'),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.darkModeBlack.withOpacity(.5),
              ),
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.width * 0.09,
                  width: size.width * 0.6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: priceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.blueAccent,
                        onTap: () {
                          setState(() {
                            priceList.forEach(
                                (element) => element.isSelected = false);
                            priceList[index].isSelected = true;
                          });
                        },
                        child: RadioItem(priceList[index]),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await _trainerStore.addBasketFromTrainer(
                        widget.service.id,
                        priceList
                            .singleWhere(
                                (element) => element.isSelected == true)
                            .period
                            .toString());
                    if (_trainerStore.isAddBasket) {
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Eklendi'),
                        ),
                      );
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: AppColors.purple,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.0225,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 14,
                          ),
                          Text(
                            ln(context, 'add_to_basket'),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.dumbbell,
                        color: widget.service.is_exercise
                            ? AppColors.darkModeBlack.withOpacity(0.7)
                            : AppColors.darkModeBlack.withOpacity(0.2),
                        size: 12),
                    const SizedBox(width: 5),
                    Text(
                      ln(context, 'exercise'),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: widget.service.is_exercise
                              ? AppColors.darkModeBlack.withOpacity(0.7)
                              : AppColors.darkModeBlack.withOpacity(0.2)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.utensils,
                        color: widget.service.is_nutrition
                            ? AppColors.darkModeBlack.withOpacity(0.7)
                            : AppColors.darkModeBlack.withOpacity(0.2),
                        size: 12),
                    const SizedBox(width: 5),
                    Text(
                      ln(context, 'diet'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: widget.service.is_nutrition
                            ? AppColors.darkModeBlack.withOpacity(0.7)
                            : AppColors.darkModeBlack.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.fire,
                        color: widget.service.is_supplement
                            ? AppColors.darkModeBlack.withOpacity(0.7)
                            : AppColors.darkModeBlack.withOpacity(0.2),
                        size: 12),
                    const SizedBox(width: 5),
                    Text(
                      ln(context, 'supplement'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: widget.service.is_supplement
                            ? AppColors.darkModeBlack.withOpacity(0.7)
                            : AppColors.darkModeBlack.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
