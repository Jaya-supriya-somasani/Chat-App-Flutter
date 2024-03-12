import 'package:chat_app/app_bloc.dart';
import 'package:chat_app/app_states.dart';
import 'package:chat_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:chat_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WelcomeBloc()),
          BlocProvider(create: (context) => AppBloc())
        ],
        child: ScreenUtilInit(
          builder: (context, child) => const MaterialApp(
            home: Welcome(),
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chat app"),
      ),
      body: Center(child: BlocBuilder<AppBloc, AppStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBloc>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
