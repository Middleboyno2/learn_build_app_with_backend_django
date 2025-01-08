import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/const/constants.dart';

import 'package:shoes_store/src/home/controllers/home_notifier.dart';
import 'package:shoes_store/src/home/widgets/carousel/carousel_slider.dart';
import 'package:shoes_store/src/home/widgets/category_widget/category_list.dart';
import 'package:shoes_store/src/home/widgets/category_widget/category_widget.dart';
import 'package:shoes_store/src/home/widgets/custom_app_bar.dart';
import 'package:shoes_store/src/home/widgets/home_tab.dart';



  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
    late final TabController _tabController;
    int _currentTabIndex = 0;
    @override
    void initState() {
      _tabController = TabController(length: homeTabs.length, vsync: this);

      _tabController.addListener(_handleSelection);
      super.initState();
    }

    void _handleSelection(){
      final controller = Provider.of<HomeNotifier>(context, listen: false);

      if(_tabController.indexIsChanging){
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
      controller.setIndexTab(homeTabs[_currentTabIndex]);
    }

    @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_handleSelection);
    _tabController.dispose();
  }

    @override
    Widget build(BuildContext context) {
      return Consumer<HomeNotifier>(
        builder: (BuildContext context, HomeNotifier value, Widget? child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: CustomAppBar(
                changeSearch: value.changeSearch,
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Banner
                      SizedBox(
                        width: ScreenUtil().screenWidth,
                        height: ScreenUtil().screenHeight / 4,
                        child: CustomCarousel(),
                      ),

                      // Category
                      CategoryWidget(),
                      CategoryList(),
                      HomeTab(tabController: _tabController)
                    ],
                  ),
                ),
              ],
            ),
          );
        },

      );
    }
  }
