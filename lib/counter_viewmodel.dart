import 'package:flutter/material.dart';
import 'package:providerwithviewmodel/counter.dart';

class CounterViewModel extends ChangeNotifier {
  Counter _counter = Counter();

  int get counter => _counter.value;
  int get index => _counter.index;

  void increment() {
    _counter.value++;
    notifyListeners();
  }

  void indexIncrement() {
    _counter.index++;
    notifyListeners();
  }
}
