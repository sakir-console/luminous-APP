import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _myController;
  int position = 1 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luminous S'),
      ),
      body:  IndexedStack(
        index: position,
        children: [
          WebView(
            // initialUrl: "https://google.com",
            initialUrl: "https://stellarium-web.org/",
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (value){setState(() {
              position = 1;
            });},
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              _myController = webViewController;
//            _myController.evaluateJavascript("document.getElementsByClassName(\"zGVn2e\")[0].style.display='none';");
            },
            onPageFinished: (String url) {
              print('-----------------Page finished loading: $url');
              setState(() {
                position = 0;
              });
              _myController.evaluateJavascript(
                  "document.querySelector('.v-btn').click();");
              _myController.evaluateJavascript(
                  "document.querySelector('#toolbar-image').style.display='none';");
            },
          ),
          Container(
            child: Center(
                child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}