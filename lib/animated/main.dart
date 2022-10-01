import 'package:flutter/material.dart';
import 'package:luminous/animated/rive_demo.dart';
import 'package:luminous/pages/solar.dart';

import 'explicit_demo.dart';
import 'implicit_demo.dart';
//import 'buttons/ButtonDemo.dart';


class AnimApp extends StatefulWidget {

  @override
  State<AnimApp> createState() => _AnimAppState();
}

class _AnimAppState extends State<AnimApp> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SolarSystem()),
        ));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        // textButtonTheme: TextButtonThemeData(
        //     style: TextButton.styleFrom(primary: Colors.red)),
      ),
      home: ImplicitDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
