import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luminous/iland/main.dart';
import 'package:luminous/iland/screens/home.dart';
import 'package:luminous/iland/widgets/call_shrinked.dart';
import 'package:luminous/iland/widgets/directions_expanded.dart';
import 'package:luminous/iland/widgets/directions_shrinked.dart';
import 'package:luminous/iland/widgets/music_expanded.dart';
import 'package:luminous/iland/widgets/music_shrinked.dart';
import 'package:luminous/pages/learn/cataclysmic.dart';
import 'package:luminous/pages/learn/cepheids.dart';
import 'package:luminous/pages/learn/game.dart';
import 'package:luminous/pages/learn/light_curves.dart';
import 'package:luminous/pages/solar.dart';
import 'package:luminous/pages/stellarium.dart';
import 'package:luminous/stellarium/view.dart';
import 'package:scaled_list/scaled_list.dart';
import 'dart:math' as math;

import '../../main.dart';

class Learns extends StatefulWidget {
  static const animationDuration = Duration(milliseconds: 300);

  @override
  State<Learns> createState() => _LearnsState();
}

class _LearnsState extends State<Learns> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  //  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/11.jpg'),
                          fit: BoxFit.cover)),
                ),
                Menu()
              ],
            ),
          ),
        ));
  }
}

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<Color> kMixedColors = [
    Colors.blueGrey,
    Colors.blue,
    Colors.black87,
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [

    Category(image: "assets/images/Learn.png", name: " Learn Stellar Variability", route: StellarGame()),
    Category(image: "assets/images/Cepheids.png", name: "Cepheids Variables", route: Cepheids()),
    Category(image: "assets/images/lc.png", name: "Light Curves", route: LightCurves()),
    Category(image: "assets/images/Test.png", name: "Test Yourself", route: iLand()),

    Category(image: "assets/images/ctv.png", name: "Cataclysmic Variables", route: Cataclysmic())
  ];
  int activePageIndex = 0;
  bool shrinked = true;
  bool showIsland = true;
  static const animationDuration = Duration(milliseconds: 300);
  final List<Island> islands = [
    Island(
        shrinkedIsland: CallShrinked(),
        expandedIsland: CallShrinked(),
        expandedHeight: 75,
        expandedBorderRadius: 40),
    Island(
        shrinkedIsland: MusicShrinked(),
        expandedIsland: MusicExpanded(),
        expandedHeight: 180,
        expandedBorderRadius: 40),
    Island(
        shrinkedIsland: DirectionsShrinked(),
        expandedIsland: DirectionsExpanded(),
        expandedHeight: 180,
        expandedBorderRadius: 40),
    Island(
        shrinkedIsland: DirectionsShrinked(),
        expandedIsland: DirectionsExpanded(),
        expandedHeight: 180,
        expandedBorderRadius: 40),
    Island(
        shrinkedIsland: DirectionsShrinked(),
        expandedIsland: DirectionsExpanded(),
        expandedHeight: 180,
        expandedBorderRadius: 40)
  ];

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  setActivePageIndex(i) {
    setState(() {
      activePageIndex = i;
    });
  }

  toggleIsland() {
    setState(() {
      showIsland = false;
      shrinked = !shrinked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeIsland = islands[activePageIndex];
    final islandToBeShown =
    shrinked ? activeIsland.shrinkedIsland : activeIsland.expandedIsland;
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: toggleIsland,
            child: AnimatedContainer(
                onEnd: () => setState(() {
                  showIsland = true;
                }),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                        shrinked ? 20.0 : activeIsland.expandedBorderRadius)),
                duration: MyApp.animationDuration,
                curve: Curves.easeInOut,
                height: shrinked ? 35 : activeIsland.expandedHeight,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (shrinked ? 10.0 : 15.0), vertical: 5),
                  child: AnimatedSwitcher(
                      duration: MyApp.animationDuration,
                      child: showIsland ? islandToBeShown : SizedBox()),
                )),
          ),
        ),
        SizedBox(height: 50,),
        Center(child:SizedBox(
          height: 100.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText('Explore '),
                FadeAnimatedText('the Sky'),
                FadeAnimatedText('Explore it NOW!!'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ) ),
        SizedBox(height: 20,),
        Center(
          child: ScaledList(
            cardWidthRatio: 0.6,
            marginWidthRatio: 0.1,
            selectedCardHeightRatio: 0.3,
            unSelectedCardHeightRatio: 0.2,
            itemCount: categories.length,
            itemColor: (index) {
              return kMixedColors[index % kMixedColors.length];
            },
            itemBuilder: (index, selectedIndex) {

              /* setState(() {

              });*/
              print('Selected--------------------$selectedIndex');
              final category = categories[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => category.route));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: selectedIndex == index ? 100 : 80,
                      child: Image.asset(category.image),
                    ),
                    SizedBox(height: 15),
                    Text(
                      category.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: selectedIndex == index ? 25 : 20),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Category {
  final String image;
  final String name;
  final Widget route;

  Category({required this.image, required this.name, required this.route});
}
