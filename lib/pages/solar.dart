import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SolarSystem extends StatefulWidget {
  @override
  _SolarSystemState createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
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
            initialUrl: "https://solarsystem.nasa.gov/solar-system/our-solar-system/overview/",
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
              //_myController.evaluateJavascript("document.querySelector('.v-btn').click();");
              _myController.evaluateJavascript("document.querySelector('.site_header').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.more_bar').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.middle_nav').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.feature_pages').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.module').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.suggested_features').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('#site_footer').style.display='none';");
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