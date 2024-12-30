
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/services/storage.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/widgets/login_bottom_sheet.dart';

class HomeNotifier extends ChangeNotifier{
  // on/off search
  bool _isSearch = false;
  // search controller
  TextEditingController searchController = TextEditingController();
  // select card
  bool _isCard = false;



  //============================================================================


  // get status search
  bool get isSearch => _isSearch;

  // get status select card
  bool get isCard => _isCard;


  void changeSearch(){
    _isSearch = !_isSearch;
    notifyListeners();
  }

  void changeCard(){
    _isCard = !_isCard;
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