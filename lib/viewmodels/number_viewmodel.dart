// Define View Model
// "_model" is defining the Number model
// We also use "get" method to give the num to _model.num, which is number of model in MVVM

// ChangeNotifier is native class of Flutter.
// When if we "extends" it or "with" it, it means corresponding class is now using the ChangeNotifier Class and using function.
// "notifyListeners" is the method to announce the real state of the class which inherit the ChangeNotifier.
// So, it can subscribe those class - which is inherited by ChangeNotifier.

// In below code, if the value of "_model" get changes, it using the "notifyListeners()" to announce about the change of value.

import 'package:flutter/material.dart';
import 'package:mvvm_provider/models/number.dart';

class NumberViewModel with ChangeNotifier {
  final Number _model = Number();

  int get num => _model.num;

  void incrementNum() {
    _model.increment();
    notifyListeners();
  }

  void decrementNum() {
    _model.decrement();
    notifyListeners();
  }
}