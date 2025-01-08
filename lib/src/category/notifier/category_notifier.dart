

import 'package:flutter/material.dart';

class CategoryNotifier with ChangeNotifier{
  String category = '';

  int _id = 0;

  int get id => _id;

  void setCategory(int id, String c){
    category = c;
    _id = id;
    notifyListeners();
  }

}