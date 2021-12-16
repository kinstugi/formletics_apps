import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/payment/data/models/basket_price_model.dart';

class PriceCardWidget extends StatelessWidget {
  final BasketPriceModel price;
  const PriceCardWidget({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 15,
        right: 15,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          right: 3,
          bottom: 3,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 3,
            offset: Offset(2, 2)
          )
        ]),
        child: Card(
          color: AppColors.darkModeBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(ln(context, 'product_total'),
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                    Text("₺${price.product_total_price.toString()}",
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(ln(context, 'service_total'),
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                    Text("₺${price.service_total_price.toString()}",
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(ln(context, 'shipping_fee'),
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                    Text(ln(context, 'free'),
                      style: TextStyle(
                        fontSize: 14, color: AppColors.cyanColor
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(ln(context, 'total'),
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                    Text("₺${price.total_price.toString()}",
                      style: const TextStyle(fontSize: 14, color: Colors.white)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
