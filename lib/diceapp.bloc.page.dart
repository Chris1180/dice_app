import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diceapp.bloc.rolldice.dart';

class DiceAppBlocPage extends StatelessWidget {
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  double _currentSliderValue = 6;
  int total = 1;

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
                for (int z = 1; z <= _currentSliderValue && z <= 3; z++)
                  BlocBuilder<RollDiceBloc, List<int>> (
                      builder: (context, state) {
                        print('valeur de state : $state');

                        //String imageLink;
                        //imageLink = "images/dice-png-${state[z - 1]}.png";
                        //state = numbers[z - 1];
                    return IconButton(
                      icon:
                          Image.asset("images/dice-png-${state[z - 1]}.png", ),
                      iconSize: 100,
                      onPressed: () {
                        //print('valeur de state : $state');
                        print('valeur de state[z-1] : ${state[z - 1]}');
                        context.read<RollDiceBloc>().add(BlocInstruction.ONEDICE);
                        },
                      );
                      }
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int z = 4; z <= _currentSliderValue; z++)
                  IconButton(
                    icon: Image.asset("images/dice-png-${numbers[z - 1]}.png"),
                    iconSize: 100,
                    onPressed: () {
                      ;
                    },
                  )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => {context.read<RollDiceBloc>().add(BlocInstruction.ALLDICE)}, child: Text("Roll")),
                Slider(
                  value: _currentSliderValue,
                  min: 1,
                  max: 6,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    _currentSliderValue = value;
                    //rollTheDice(0);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ));
  }
}
