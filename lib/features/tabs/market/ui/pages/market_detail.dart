import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/getwidget.dart';

class MarketDetailWidget extends StatefulWidget {
  MarketDetailWidget({Key key}) : super(key: key);

  @override
  _MarketDetailWidgetState createState() => _MarketDetailWidgetState();
}

class _MarketDetailWidgetState extends State<MarketDetailWidget> {
  final List<String> imageList = [
    "https://placeimg.com/640/360/1",
    "https://placeimg.com/640/360/2",
    "https://placeimg.com/640/360/3",
    "https://placeimg.com/640/360/4",
    "https://placeimg.com/640/360/5",
    "https://placeimg.com/640/360/6",
  ];

  String aromaValue = 'Kalamar';
  String giftValue = 'Zombi';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: GFAppBar(
            title: Text(ln(context, 'product_detail'),
                textAlign: TextAlign.left, style: TextStyle(fontSize: 14))),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: GFImageOverlay(
                                image: NetworkImage(
                                  'https://placeimg.com/600/400/89',
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Whey Protein",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                  Text("2000 Gr",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Card(
                                          margin: EdgeInsets.zero,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                            child: Text(
                                              '₺110,90',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          color: AppColors.primaryColor,
                                        ),
                                        Card(
                                          margin: EdgeInsets.zero,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 6,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 14,
                                              )),
                                          color: AppColors.greenies,
                                        ),
                                        Card(
                                          margin: EdgeInsets.zero,
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            child: Text('0'),
                                          ),
                                        ),
                                        Card(
                                          margin: EdgeInsets.zero,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 6,
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 14,
                                              )),
                                          color: AppColors.greenies,
                                        ),
                                      ]),
                                  InkWell(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Text(
                                              ln(context, 'add_to_basket'),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: AppColors.purple,
                                    ),
                                    onTap: () {},
                                  ),
                                ]),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: <Widget>[
                  Text(ln(context, 'description'),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14)),
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ln(context, 'sample_text'),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.subtitleColor.withOpacity(.87),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(ln(context, 'flavor'),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                    ]),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: size.width * .30,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColors.dropdownColor,
                    value: aromaValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.white),
                    onChanged: (String newValue) {
                      setState(() {
                        aromaValue = newValue;
                      });
                    },
                    items: <String>[
                      ln(context, 'item_1'),
                      ln(context, 'item_2'),
                      ln(context, 'item_3'),
                      ln(context, 'item_4')
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(ln(context, 'gift'),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                    ]),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: size.width * .30,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColors.dropdownColor,
                    value: giftValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.white),
                    onChanged: (String newValue) {
                      setState(() {
                        giftValue = newValue;
                      });
                    },
                    items: <String>[
                      ln(context, 'item_5'),
                      ln(context, 'item_6'),
                      ln(context, 'item_7'),
                      ln(context, 'item_8')
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: RaisedButton(
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(ln(context, 'proceed_to_payment')),
          ),
        ));
  }
}
