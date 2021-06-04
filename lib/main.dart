import 'package:dice_app/diceapp.bloc.page.dart';
import 'package:dice_app/provider/diceapp.state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/diceapp.bloc.rolldice.dart';
import 'diceapp.provider.page.dart';


void main() {
  runApp(DiceAppBloc());
}

///      Provider part
class DiceAppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>DiceAppState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dice App',
        home: DiceAppProviderPage(),
      ),
    );
  }
}


///////////////// Bloc part


class DiceAppBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RollDiceBloc(
            initialState: DiceAppStateBloc()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dice App',
        home: DiceAppBlocPage(),
      ),
    );
  }
}

