
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/services/storage.dart';
import 'package:shoes_store/common/widgets/login_bottom_sheet.dart';

class HomeNotifier extends ChangeNotifier{

  // select card
  bool _isCard = false;

  //============================================================================


  // get status select card
  bool get isCard => _isCard;


  void changeCard(){
    _isCard = !_isCard;
    notifyListeners();
  }

  void changeSearch(BuildContext context){
    context.go("/search");
    notifyListeners();
  }

  void isLoggedIn(BuildContext context){
    if (Storage().getString("accessToken") == null) {
      loginBottomSheet(context);
    }else{
      context.push("/notifications");
    }
  }


}