
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/services/storage.dart';
import 'package:shoes_store/common/utils/enums.dart';
import 'package:shoes_store/common/widgets/login_bottom_sheet.dart';

class HomeNotifier extends ChangeNotifier{
  QueryType queryType = QueryType.all;
  // select card
  bool _isCard = false;

  //index tab home
  String _indexTab = 'All';
  //============================================================================


  // get status select card
  bool get isCard => _isCard;

  // get tab
  String get index => _indexTab;

  //============================================================================
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

  void setIndexTab(String index){
    _indexTab = index;

    switch(index){
      case 'All':
        setQueryType= QueryType.all;
        break;
      case 'Popular':
        setQueryType= QueryType.popular;
        break;
      case 'Unisex':
        setQueryType= QueryType.unisex;
        break;
      case 'Men':
        setQueryType= QueryType.men;
        break;
      case 'Women':
        setQueryType= QueryType.women;
        break;
      case 'Kids':
        setQueryType= QueryType.kids;
        break;

      default:
        setQueryType= QueryType.all;
    }
  }

  set setQueryType(QueryType q){
    queryType = q;
    // debugPrint(queryType.name);
  }


}