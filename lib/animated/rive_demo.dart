import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveDemo extends StatefulWidget {

  @override
  _RiveDemoState createState() => _RiveDemoState();
}

class _RiveDemoState extends State<RiveDemo> {
  bool get isPlaying => _controller?.isActive ?? false;

  late Artboard _riveArtboard;
  late RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/animations/rocket_rive.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  void _launchRocket() {
    _riveArtboard.addController(_controller = SimpleAnimation('launch'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchRocket,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
