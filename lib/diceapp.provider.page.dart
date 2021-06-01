import 'package:dice_app/provider/diceapp.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class  DiceAppProviderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DiceAppState diceAppState=Provider.of(context, listen: false);
    print("Build-------------");
    return Scaffold(
      appBar: AppBar(
        leading: ImageIcon(
          AssetImage("images/logo.png"),
        ),
        title: Text("Dice App"),
      ),
      body: Consumer<DiceAppState>(
        builder: (context, diceAppState, child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  "Total: ${diceAppState.total}",
                  style: TextStyle(height: 2, color: Colors.orange, fontSize: 25),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for(int z=1; z<=diceAppState.currentSliderValue && z<=3 ; z++)IconButton(
                    icon: Image.asset("images/dice-png-${diceAppState.numbers[z-1]}.png"),
                    iconSize: 100,
                    onPressed: () {
                      diceAppState.rolldice(z);
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for(int z=4; z<=diceAppState.currentSliderValue; z++)IconButton(
                    icon: Image.asset("images/dice-png-${diceAppState.numbers[z-1]}.png"),
                    iconSize: 100,
                    onPressed: () {
                      diceAppState.rolldice(z);
                    },
                  )
                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => diceAppState.rolldice(0), child: Text("Roll")),
                  Slider(
                    value: diceAppState.currentSliderValue,
                    min: 1,
                    max: 6,
                    divisions: 5,
                    label: diceAppState.currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      diceAppState.currentSliderValue = value;
                      diceAppState.rolldice(0);
                    },
                  ),
                ],
              ),
              SizedBox(height: 5,)
            ],
          );
        },
      )
    );
  }
}


