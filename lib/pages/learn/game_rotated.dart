import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class StellarGameRotated extends StatefulWidget {
  @override
  _StellarGameRotatedState createState() => _StellarGameRotatedState();
}

class _StellarGameRotatedState extends State<StellarGameRotated> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _myController;
  int position = 1 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotated Game'),
      ),
      body:  IndexedStack(
        index: position,
        children: [

          WebView(
            // initialUrl: "https://google.com",
            initialUrl: "https://mrnussbaum.com/uploads/activities/ssm/game/index.html",
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (value){
              setState(() {
              position = 1;
                  });

              },
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
                  "start_game();");
              _myController.evaluateJavascript("document.querySelector('#main_div').style.top='700px';");
              _myController.evaluateJavascript("document.querySelector('#main_div').style.left='100px';"); 
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