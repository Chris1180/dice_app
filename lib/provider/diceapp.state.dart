import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiceAppState extends ChangeNotifier{

  List numbers = [1,2,3,4,5,6];
  double currentSliderValue = 1;
  int total=1;

  void rolldice(int diceNumber){
    total=0;
    if (diceNumber!=0){
      numbers[diceNumber-1] = Random().nextInt(6) + 1;
    }
    for(int i=0; i<currentSliderValue; i++){
      if (diceNumber == 0) numbers[i] = Random().nextInt(6) + 1;
      total = total + numbers[i];
    }
    notifyListeners();
  }

}