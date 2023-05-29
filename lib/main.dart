import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerwithviewmodel/counter_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    log('in builddd..;');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IndexWidget(),
            StateWidget(),
            const SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    log('onClick index...');
                    context.read<CounterViewModel>().indexIncrement();
                  },
                  child: const Text('index Button'),
                ),
                const SizedBox(
                  width: 14.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    log('onClick count...');
                    context.read<CounterViewModel>().increment();
                  },
                  child: const Text('count Button'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StateWidget extends StatelessWidget {
  const StateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _count = context.select<CounterViewModel, int>((viewModel) {
      return viewModel.counter;
    });
    return Text(
      'count : $_count',
    );
  }
}

class IndexWidget extends StatelessWidget {
  const IndexWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log('Index Widget build...');
    final _index =
        context.select<CounterViewModel, int>(((viewModel) => viewModel.index));
    return Text(
      'index : ${_index}',
    );
  }
}
