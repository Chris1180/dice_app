import 'package:dice_app/diceapp.bloc.page.dart';
import 'package:dice_app/provider/diceapp.state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'diceapp.bloc.rolldice.dart';
import 'diceapp.provider.page.dart';


void main() {
  runApp(DiceAppProvider());
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


class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RollDiceBloc([1, 5, 3, 4, 5, 6]))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dice App',
        home: DiceAppBlocPage(),
      ),
    );
  }
}

