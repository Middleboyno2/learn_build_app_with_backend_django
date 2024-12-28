
import 'package:flutter/widgets.dart';

class HomeNotifier extends ChangeNotifier{
  // on/off search
  bool _isSearch = false;
  // search controller
  TextEditingController searchController = TextEditingController();

  // get status search
  bool get isSearch => _isSearch;

  void changeSearch(){
    _isSearch = !_isSearch;
    notifyListeners();
  }
}