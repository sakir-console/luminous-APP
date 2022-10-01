import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Cataclysmic extends StatefulWidget {
  @override
  _CataclysmicState createState() => _CataclysmicState();
}

class _CataclysmicState extends State<Cataclysmic> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _myController;
  int position = 1 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cataclysmic'),
      ),
      body:  IndexedStack(
        index: position,
        children: [
          WebView(
            // initialUrl: "https://google.com",
            initialUrl: "https://gamaverse.com/neo-gravity-game/",
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