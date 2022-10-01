import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luminous/VR/main.dart';
import 'package:luminous/iland/main.dart';
import 'package:luminous/pages/learn/cataclysmic.dart';
import 'package:luminous/pages/learn/cepheids.dart';
import 'package:luminous/pages/learn/game.dart';
import 'package:luminous/pages/learn/learns.dart';
import 'package:luminous/pages/learn/light_curves.dart';
import 'package:luminous/pages/solar.dart';
import 'package:luminous/pages/stellarium.dart';
import 'package:luminous/stellarium/view.dart';
import 'package:scaled_list/scaled_list.dart';
import 'dart:math' as math;
import 'animated/main.dart';
import 'iland/screens/home.dart';
import 'iland/widgets/call_expanded.dart';
import 'iland/widgets/call_shrinked.dart';
import 'iland/widgets/directions_expanded.dart';
import 'iland/widgets/directions_shrinked.dart';
import 'iland/widgets/music_expanded.dart';
import 'iland/widgets/music_shrinked.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const animationDuration = Duration(milliseconds: 300);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
                          image: AssetImage('assets/images/55.jpg'),
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
    Category(
        image: "assets/images/roc.png", name: "Lunch Rocket", route: AnimApp()),
    Category(
        image: "assets/images/stellarium.png",
        name: "Stellar search",
        route: Stellarium()),
    Category(image: "assets/images/solar.png", name: "Solar System", route: SolarSystem()),
    Category(image: "assets/images/VR.png", name: "Virtual Reality", route: MyVR()),
    Category(image: "assets/images/Learn.png", name: "Learns", route: Learns()),
    Category(image: "assets/images/Communication.png", name: "Communication", route: iLand()),
    Category(image: "assets/images/intro.png", name: "About Us", route: iLand()),

  ];
  int activePageIndex = 0;
  bool shrinked = true;
  bool showIsland = true;
  static const animationDuration = Duration(milliseconds: 300);
  final List<Island> islands = [
    Island(
        shrinkedIsland: CallShrinked(),
        expandedIsland: CallShrinked(),
        expandedHeight: 45,
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
                height: shrinked ? 45 : activeIsland.expandedHeight,
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
        SizedBox(height: 70,),
        Container(
          //padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/9),
          child: Center(child:SizedBox(
            height: 100.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FadeAnimatedText('NASA SPACE APPS\nCHALLENGE ',textAlign: TextAlign.center),
                  FadeAnimatedText('TWINKLE, TWINKLE, LITTLE STAR',textAlign: TextAlign.center),
                  FadeAnimatedText('EXPLORE THE UNIVERSE..',textAlign: TextAlign.center),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ) ),
        ),
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
        SizedBox(height: 50,),
        Container(

          padding:
          const EdgeInsets.only(left: 1, right: 1, bottom: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/nasa.png',
                    height: 58,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/basis.png',
                    height: 34,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ],
          ),
        )
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
