import 'package:flutter/material.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/features/payment/ui/store/payment_store.dart';
import 'package:provider/provider.dart';

import 'confirm_payment_page.dart';

class Payment3dScreen extends StatefulWidget {
  @override
  _Payment3dScreenState createState() => _Payment3dScreenState();
}

class _Payment3dScreenState extends State<Payment3dScreen> {
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  PaymentStore _store = getIt<PaymentStore>();

  @override
  void didChangeDependencies() {
    _store ??= Provider.of<PaymentStore>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ödeme'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: const Text('Kart Sahibinin Adı'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Tronald Dump',
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: double.infinity,
                        child: const Text('kart numarası'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'eg. 123 123 123 1234',
                            suffixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('son kullanma tarihi'),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: _expiryDateController,
                                  decoration: const InputDecoration(
                                      hintText: 'mm/yy',
                                      suffixIcon:
                                          Icon(Icons.keyboard_arrow_down),
                                      border: OutlineInputBorder()),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('cvc'),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: _cvcController,
                                  decoration: const InputDecoration(
                                      hintText: '123',
                                      suffixIcon: Icon(Icons.info),
                                      border: OutlineInputBorder()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              final Map<String, dynamic> data = {
                'cardNumber': _cardNumberController.text,
                'cardHolderName': _nameController.text,
                'cvc': int.parse(_cvcController.text),
                'expire': _expiryDateController.text
              };

              final res = await _store.make3dPayment(data);

              if (res.status == "success") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ConfirmPaymentWebViewPage(
                      htmlData: res.body,
                    ),
                  ),
                );
              } else {
                Scaffold.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('failed'),
                  ),
                );
              }
            },
            visualDensity: VisualDensity.adaptivePlatformDensity,
            child: const SizedBox(
              width: double.infinity,
              child: Text(
                'öde',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
