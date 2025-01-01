

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/utils/app_routes.dart';

class SearchNotifier with ChangeNotifier{

  // on/off search
  bool _isSearch = false;

  // on/off filter
  bool _isFilter = false;

  // search controller
  TextEditingController searchController = TextEditingController();

  ScrollController _scrollController = ScrollController();

  bool _isExpanded = false;


  // get status search
  bool get isSearch => _isSearch;

  // get status filter
  bool get isFilter => _isFilter;

  ScrollController get scrollController => _scrollController;

  bool get isExpanded => _isExpanded;

  void goBackHome(BuildContext context){
    context.go("/home") ;
    notifyListeners();
  }

  void changeFilter(){
    _isFilter = !_isFilter;
    debugPrint("${_isFilter}");
    notifyListeners();
  }

  void toggleAppBar() {

    // if (_isExpanded) {
    //   // Thu gọn AppBar
    //   _scrollController.animateTo(
    //     _scrollController.position.minScrollExtent, // Cuộn đến đầu
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // } else {
    //   // Mở rộng AppBar
    //   _scrollController.animateTo(
    //     200.0, // Chiều cao expandedHeight
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // }

    _isExpanded = !_isExpanded; // Đảo trạng thái

    _isFilter = !_isFilter;
    debugPrint("${_isFilter}");

    notifyListeners();
  }

}