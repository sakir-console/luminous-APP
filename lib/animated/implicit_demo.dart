import 'package:flutter/material.dart';

class ImplicitDemo extends StatefulWidget {
  @override
  _ImplicitDemoState createState() => _ImplicitDemoState();
}

class _ImplicitDemoState extends State<ImplicitDemo>
    with SingleTickerProviderStateMixin {
  double bottomMargin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sky.png'),
                    fit: BoxFit.cover)),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            height: 350,
            width: 250,
            margin: EdgeInsets.only(bottom: bottomMargin),
            child: Image.asset('assets/images/rocket.png'),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _flyRocket();
                },
                child: Text(
                  'Launch',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                color: Colors.red,
                textColor: Colors.white,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _flyRocket() {
    setState(() {
      bottomMargin = 500;
    });
  }
}
