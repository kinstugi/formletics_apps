import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/payment/ui/store/payment_store.dart';
import 'package:formletics/features/payment/ui/widgets/price_card_widget.dart';
import 'package:formletics/widgets/loading/loading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PaymentBasketWidget extends StatefulWidget {
  @override
  _PaymentBasketWidgetState createState() => _PaymentBasketWidgetState();
}

class _PaymentBasketWidgetState extends State<PaymentBasketWidget> {
  final progressKey = GlobalKey();

  PaymentStore _paymentStore = getIt<PaymentStore>();

  @override
  void didChangeDependencies() {
    _paymentStore ??= Provider.of<PaymentStore>(context);
    _paymentStore.resetBasket();
    _paymentStore.getBasket();

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _paymentStore.resetBasket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: GFAppBar(
          title: Text(ln(context, 'my_basket'),
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
                  MultiProvider(
                    providers: [
                      Provider<PaymentStore>(create: (_) => _paymentStore),
                    ],
                    child: Observer(
                      builder: (_) {
                        if (_paymentStore.isSucceedGetBasket ==
                            StateStatus.LOADING) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Loading(),
                          );
                        } else if (_paymentStore.basket == null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ln(context, 'basket_empty'),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          );
                        } else {
                          return const SizedBox(height: 0.01,);
                        }
                      },
                    ),
                  ),

                 //TODO put back
                  secondMulti(),
                  thirdMulti(),
                  fourthMulti(),

                ],
              ),
            ),
          ],
        ),


        bottomNavigationBar: Container(
          child: RaisedButton(
            onPressed: () {
              navigateToRouteAndReplace(context, Routes.payment3dScreen);
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(ln(context, 'proceed_to_payment')),
          ),
        ),
    );
  }

  Widget secondMulti(){
    return MultiProvider(
      providers: [
        Provider<PaymentStore>(create: (_) => _paymentStore),
      ],
      child: Observer(
        // ignore: missing_return
        builder: (_) {
          if (_paymentStore.basket.product.isNotEmpty) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: _paymentStore.basket.product.length,
                itemBuilder: (BuildContext context, int index) {
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
                            offset: const Offset(2, 2))
                      ]),
                      child: Card(
                        color: AppColors.darkModeBlack,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(5)),
                        ),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IntrinsicHeight(
                            child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  const Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 3 / 2,
                                      child: GFImageOverlay(
                                        image: NetworkImage(
                                          'https://placeimg.com/600/400/89',
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10),),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "${_paymentStore.basket.product[index].product.brand} ${_paymentStore.basket.product[index].product.model}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Future<bool> _onDeletePressed4P() {
                                                    return showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title:
                                                          Text(ln(context, 'are_you_sure')),
                                                          content:
                                                          Text('${_paymentStore.basket.product[index].product.brand} ${_paymentStore.basket.product[index].product.model} ürününü silmek istiyor musunuz?'),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop(false);
                                                              },
                                                              child: Text(ln(context, 'no')),
                                                            ),
                                                            FlatButton(
                                                              onPressed: () async {
                                                                await _paymentStore.removeProductBasket(_paymentStore.basket.product[index].id);
                                                                Navigator.of(context).pop(true);
                                                              },
                                                              child: Text(ln(context, 'yes')),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    ) ?? Future.value(false);
                                                  }

                                                  _onDeletePressed4P();
                                                },
                                                child: Card(
                                                  margin: EdgeInsets.zero,
                                                  color: AppColors.deleteColor,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 6,
                                                    ),
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: AppColors.iconColor,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${_paymentStore.basket.product[index].product.amount}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            ln(context, '${_paymentStore.basket.product[index].aroma} flavored'),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            ln(context, '${_paymentStore.basket.product[index].product.gift[0]} gift'),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Card(
                                                  margin: EdgeInsets.zero,
                                                  color: AppColors.primaryColor,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 8,
                                                    ),
                                                    child: Text(
                                                      "₺${_paymentStore.basket.product[index].product.price.toString()}",
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final int product_id = _paymentStore.basket.product[index].id;
                                                    await _paymentStore.patchChangeQuantity(0, product_id, _paymentStore.basket.product[index].count);
                                                    await _paymentStore.getBasket();
                                                    // setState(() {});
                                                  },
                                                  child: Card(
                                                    margin: EdgeInsets.zero,
                                                    color: AppColors.greenies,
                                                    child: const Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 6,
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Card(
                                                  margin:
                                                  EdgeInsets.zero,
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                    ),
                                                    child: Text(_paymentStore.basket.product[index].count.toString()),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final int product_id = _paymentStore.basket.product[index].id;
                                                    await _paymentStore.patchChangeQuantity(1, product_id, _paymentStore.basket.product[index].count);
                                                    await _paymentStore.getBasket();
                                                    // setState(() {});
                                                  },
                                                  child: Card(margin: EdgeInsets.zero,
                                                    color: AppColors.greenies,
                                                    child: const Padding(
                                                        padding: EdgeInsets.symmetric(
                                                          vertical: 5,
                                                          horizontal: 6,
                                                        ),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 14,
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ]
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
            );
          }

          return const SizedBox(height: 0.01,);
        },
      ),
    );
  }

  Widget thirdMulti(){
    return MultiProvider(
      providers: [
        Provider<PaymentStore>(create: (_) => _paymentStore),
      ],
      child: Observer(
        // ignore: missing_return
        builder: (_) {
          if (_paymentStore.basket.service.isNotEmpty) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemCount: _paymentStore.basket.service.length,
                itemBuilder: (BuildContext context, int index) {
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
                          offset: const Offset(2, 2))
                      ]),
                      child: Card(
                        color: AppColors.darkModeBlack,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(5)),
                        ),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IntrinsicHeight(
                            child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  const Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 3 / 2,
                                      child: GFImageOverlay(
                                        image: NetworkImage(
                                          'https://placeimg.com/600/400/90',
                                        ),
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(
                                                10)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                _paymentStore.basket.service[index].service.name,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                                              InkWell(

                                                onTap: () {
                                                  Future<bool>
                                                  _onDeletePressed4S() {
                                                    return showDialog(
                                                      context:
                                                      context,
                                                      builder:
                                                          (context) {
                                                        return AlertDialog(
                                                          title:
                                                          Text(ln(context, 'are_you_sure')),
                                                          content:
                                                          Text('${_paymentStore.basket.service[index].service.name} hizmetini silmek istiyor musunuz?'),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop(false);
                                                              },
                                                              child: Text(ln(context, 'no')),
                                                            ),
                                                            FlatButton(
                                                              onPressed: () async {
                                                                await _paymentStore.removeServiceBasket(_paymentStore.basket.service[index].id);
                                                                Navigator.of(context).pop(true);
                                                              },
                                                              child: Text(ln(context, 'yes')),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                        Future.value(
                                                            false);
                                                  }

                                                  _onDeletePressed4S();
                                                },
                                                child: Card(
                                                  margin: EdgeInsets.zero,
                                                  color: AppColors.deleteColor,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 6,
                                                    ),
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: AppColors.iconColor,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            ln(context, 'sample_trainer'),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey
                                            ),
                                          ),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Card(
                                                  margin: EdgeInsets.zero,
                                                  color: AppColors.purple,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 6,
                                                    ),
                                                    child: Text(
                                                      "${"${_paymentStore.basket.service[index].period}"} ${ln(context, 'monthly')}",
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_paymentStore.basket.service[index].service.is_exercise)
                                                  FaIcon(
                                                    FontAwesomeIcons.dumbbell,
                                                    color: AppColors.purple,
                                                    size: 18
                                                  )
                                                else
                                                  FaIcon(
                                                    FontAwesomeIcons.dumbbell,
                                                    color: AppColors.purple.withOpacity(0.2),
                                                    size: 18
                                                  ),
                                                if (_paymentStore.basket.service[index].service.is_nutrition)
                                                  FaIcon(
                                                    FontAwesomeIcons.utensils,
                                                    color: AppColors.purple,
                                                    size: 18
                                                  )
                                                else
                                                  FaIcon(
                                                    FontAwesomeIcons.utensils,
                                                    color: AppColors.purple.withOpacity(0.2),
                                                    size: 18
                                                  ),
                                                if (_paymentStore.basket.service[index].service.is_nutrition)
                                                  FaIcon(
                                                    FontAwesomeIcons.fire,
                                                    color: AppColors.purple,
                                                    size: 18
                                                  )
                                                else
                                                  FaIcon(
                                                    FontAwesomeIcons.fire,
                                                    color: AppColors.purple.withOpacity(0.2),
                                                    size: 18
                                                  ),
                                              ]
                                          ),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Card(
                                                  margin: EdgeInsets.zero,
                                                  color: AppColors.primaryColor,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal:
                                                      8,
                                                    ),
                                                    child: Text(
                                                      '₺${_paymentStore.basket.service[index].price}',
                                                      style: const TextStyle(
                                                        fontSize:
                                                        12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ],
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
            );
          }
        },
      ),
    );
  }

  Widget fourthMulti(){
    return MultiProvider(
      providers: [
        Provider<PaymentStore>(create: (_) => _paymentStore),
      ],
      child: Observer(
        // ignore: missing_return
        builder: (_) {
          if (_paymentStore.basket.prices.isNotEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return PriceCardWidget(
                    price: _paymentStore.basket.prices.last,
                  );
                }
              ),
            );
          }
        },
      ),
    );
  }
}

