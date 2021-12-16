//import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConfirmPaymentWebViewPage extends StatefulWidget {
  final String htmlData;

  const ConfirmPaymentWebViewPage({@required this.htmlData});

  @override
  _ConfirmPaymentWebViewPageState createState() => _ConfirmPaymentWebViewPageState();
}

class _ConfirmPaymentWebViewPageState extends State<ConfirmPaymentWebViewPage> {
  WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onay Kodu Girin'),
      ),

      body: Builder(builder: (ctx){
        return WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            final String contentBase64 = base64Encode(
              const Utf8Encoder().convert(widget.htmlData)
            );
            _controller.loadUrl('data:text/html;base64,$contentBase64');
          },

        );
      }),
    );
  }
}
