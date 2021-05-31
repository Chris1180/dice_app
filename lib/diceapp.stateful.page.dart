import 'dart:math';
import 'package:flutter/material.dart';

class DiceAppStatefulPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<DiceAppStatefulPage> {
  List numbers = [1,2,3,4,5,6];
  double _currentSliderValue = 1;
  int total=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ImageIcon(
          AssetImage("images/logo.png"),
        ),
        title: Text("Dice App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              "Total: $total",
              style: TextStyle(height: 2, color: Colors.orange, fontSize: 25),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for(int z=1; z<=_currentSliderValue && z<=3 ; z++)IconButton(
                icon: Image.asset("images/dice-png-${numbers[z-1]}.png"),
                iconSize: 100,
                onPressed: () {
                  rollTheDice(z);
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for(int z=4; z<=_currentSliderValue; z++)IconButton(
                icon: Image.asset("images/dice-png-${numbers[z-1]}.png"),
                iconSize: 100,
                onPressed: () {
                  rollTheDice(z);
                },
              )
            ],
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => rollTheDice(0), child: Text("Roll")),
              Slider(
                value: _currentSliderValue,
                min: 1,
                max: 6,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  _currentSliderValue = value;
                  rollTheDice(0);
                },
              ),
            ],
          ),
          SizedBox(height: 5,)
        ],
      ),
    );
  }

  void rollTheDice(int diceNumber) {
    setState(() {
      total=0;
      if (diceNumber!=0){
        numbers[diceNumber-1] = Random().nextInt(6) + 1;
      }
      for(int i=0; i<_currentSliderValue; i++){
        if (diceNumber == 0) numbers[i] = Random().nextInt(6) + 1;
        total = total + numbers[i];
      }
    });
  }
}
