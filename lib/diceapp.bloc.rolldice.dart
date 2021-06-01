import 'dart:math';

import 'package:bloc/bloc.dart';

enum BlocInstruction {ALLDICE, ONEDICE}

class RollDiceBloc extends Bloc<BlocInstruction, List<int>> {
  RollDiceBloc(state) : super(state);
  int total = 666;

  @override
  Stream<List<int>> mapEventToState(BlocInstruction event) async* {
    //List<int> numbers;
    switch (event){
      case BlocInstruction.ALLDICE:
        for(int i=0; i<6; i++){
          state[i] = Random().nextInt(6) + 1;
          total = total + state[i];
        }
        print("execution du bloc, valeur de state: $state");
        yield state;
        break;
      case BlocInstruction.ONEDICE:
        print("execution du bloc, valeur de state: $state");
        //print("execution du bloc, valeur de z: $z");
        yield state;
        break;
    }
  }

}
