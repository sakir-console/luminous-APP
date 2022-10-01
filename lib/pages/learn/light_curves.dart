import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LightCurves extends StatefulWidget {
  @override
  _LightCurvesState createState() => _LightCurvesState();
}

class _LightCurvesState extends State<LightCurves> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _myController;
  int position = 1 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        /*   actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: (){
                SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
              },
              child: Text("Full Screen"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],*/


        title:  Text('Game'),
      ),
      body:  IndexedStack(
        index: position,
        children: [

          WebView(
            // initialUrl: "https://google.com",
            initialUrl: "https://viewspace.org/interactives/unveiling_invisible_universe/analyzing_light/spectrum_of_the_star_altair",
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

              _myController.evaluateJavascript("document.querySelector('.explore-more').style.display='none';");
              // _myController.evaluateJavascript("document.querySelector('.page-section').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('footer').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.navbar').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.left-section').style.display='none';");
              _myController.evaluateJavascript("document.querySelector('.credits').style.display='none';");
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