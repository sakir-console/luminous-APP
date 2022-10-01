import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Stellarium extends StatefulWidget {
  @override
  _StellariumState createState() => _StellariumState();
}

class _StellariumState extends State<Stellarium> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _myController;
  int position = 1 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Luminous'),
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
            color: Colors.white,
            child: Center(
                child: Image.asset(
                  'assets/images/load2.gif',
                  fit: BoxFit.cover,
                  //width: 70,
                )),
          ),
        ],
      ),
    );
  }
}