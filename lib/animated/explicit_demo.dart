import 'package:flutter/material.dart';

class ExplicitDemo extends StatefulWidget {
  @override
  _ExplicitDemoState createState() => _ExplicitDemoState();
}

class _ExplicitDemoState extends State<ExplicitDemo>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -1.2))
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sky.png'),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.7),
            child: SlideTransition(
                position: animation,
                child: Container(
                  height: 350,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/rocket.png'),
                  )),
                )),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      animationController.forward();
                    },
                    child: Text(
                      'Launch',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    color: Colors.red,
                    textColor: Colors.white,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      }
                    },
                    child: Text(
                      'Abort',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    color: Colors.red,
                    textColor: Colors.white,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
