import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/diceapp.bloc.rolldice.dart';

class DiceAppBlocPage extends StatelessWidget {
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: ImageIcon(
            AssetImage("images/logo.png"),
          ),
          title: Text("Dice App"),
        ),
        body: BlocBuilder<RollDiceBloc, DiceAppStateBloc>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    child: Text(
                      "Total: ${state.total}",
                      style: TextStyle(
                          height: 2, color: Colors.orange, fontSize: 25),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int z = 1; z <= state.numberOfDice && z <= 3; z++)
                      IconButton(
                        icon: Image.asset(
                          "images/dice-png-${state.dices[z - 1]}.png",
                        ),
                        iconSize: 100,
                        onPressed: () {
                          state.diceNumber = z - 1;
                          context.read<RollDiceBloc>().add(DiceEvent.ONEDICE);
                        },
                      )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int z = 4; z <= state.numberOfDice; z++)
                      IconButton(
                        icon: Image.asset(
                            "images/dice-png-${state.dices[z - 1]}.png"),
                        iconSize: 100,
                        onPressed: () {
                          state.diceNumber = z - 1;
                          context.read<RollDiceBloc>().add(DiceEvent.ONEDICE);
                        },
                      )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => {
                              context
                                  .read<RollDiceBloc>()
                                  .add(DiceEvent.ALLDICE)
                            },
                        child: Text("Roll")),
                    Slider(
                      value: _currentSliderValue,
                      min: 1,
                      max: 6,
                      divisions: 5,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        _currentSliderValue = value;
                        state.numberOfDice = value.toInt();
                        context.read<RollDiceBloc>().add(DiceEvent.ALLDICE);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            );
          },
        ));
  }
}
