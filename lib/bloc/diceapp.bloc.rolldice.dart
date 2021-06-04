import 'dart:math';

import 'package:bloc/bloc.dart';

enum DiceEvent {ALLDICE, ONEDICE}

class DiceAppStateBloc {
  List<int> dices = [1, 2, 3, 4, 5, 6];
  int total = 15;
  int numberOfDice = 5;
  int diceNumber;
}

class RollDiceBloc extends Bloc<DiceEvent, DiceAppStateBloc> {

  RollDiceBloc({DiceAppStateBloc initialState}) : super(initialState);


  @override
  Stream<DiceAppStateBloc> mapEventToState(DiceEvent event) async* {

    switch (event){
      case DiceEvent.ALLDICE:
        DiceAppStateBloc newstate = DiceAppStateBloc();
        newstate.numberOfDice = state.numberOfDice;
        newstate.total=0;
        for(int i=0; i<newstate.numberOfDice; i++){
          newstate.dices[i] = Random().nextInt(6) + 1;
          newstate.total = newstate.total + newstate.dices[i];
        }
        yield newstate;
        break;

        case DiceEvent.ONEDICE:
          DiceAppStateBloc newstate = DiceAppStateBloc();
          newstate.dices = state.dices;
          newstate.total = 0;
          newstate.numberOfDice = state.numberOfDice;
          newstate.diceNumber = state.diceNumber;
          newstate.dices[state.diceNumber] = Random().nextInt(6) + 1;
          for(int i=0; i<newstate.numberOfDice; i++){
            newstate.total = newstate.total + newstate.dices[i];
          }
        yield newstate;
        break;
    }
  }

}
