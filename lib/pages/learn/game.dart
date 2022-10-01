import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class StellarGame extends StatefulWidget {
  @override
  _StellarGameState createState() => _StellarGameState();
}

class _StellarGameState extends State<StellarGame> {
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
            initialUrl: "https://mrnussbaum.com/uploads/activities/ssm/game/index.html",
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
                  "start_game();");
              _myController.evaluateJavascript("document.querySelector('#main_div').style.top='700px';");
              _myController.evaluateJavascript("document.querySelector('#main_div').style.left='100px';");
              _myController.evaluateJavascript("document.querySelector('body').style.background='black';");
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