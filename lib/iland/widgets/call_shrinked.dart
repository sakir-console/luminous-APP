
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'audio_waves.dart';

class CallShrinked extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: const [
            Icon(
              CupertinoIcons.rocket,
              color: Colors.greenAccent,
              size: 16,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              ' Luminous',
              style: TextStyle(color: Colors.greenAccent),
            )
          ],
        ),
        const Spacer(),
         AudioWaves()
      ],
    );
  }
}