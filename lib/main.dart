import 'dart:ui';

import 'package:dice_app/diceapp.stateful.page.dart';
import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice App',
      home: DiceAppStatefulPage(),
    );
  }
}

