

import 'package:flutter/cupertino.dart';

class BottomTabNotifier with ChangeNotifier{
  // page number
  int _selected = 0;


  // get page number
  int get selected => _selected;


  set changeSelected(int index){
    _selected = index;
    notifyListeners();
  }

}