  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:provider/provider.dart';
  import 'package:shoes_store/src/home/controllers/home_notifier.dart';
  import 'package:shoes_store/src/home/widgets/custom_app_bar.dart';
  import 'package:shoes_store/src/home/widgets/list_card/custom_card.dart';
  import 'package:shoes_store/src/home/widgets/search.dart';

  import '../../../const/resource.dart';


  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    @override
  void initState() {
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return Consumer<HomeNotifier>(
        builder: (BuildContext context, HomeNotifier value, Widget? child) {
          return Stack(
            children: [
              // first screen
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70),
                  child: CustomAppBar(
                    isSearch: value.isSearch,
                    changeSearch: value.changeSearch,
                  ),
                ),
                body: Stack(
                  children: [

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: ScreenUtil().screenWidth / 1.5,
                            height: ScreenUtil().screenHeight / 2.3,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:(context, index){
                                return Center(
                                  child: CustomCard(isSelect: value.isCard),
                                );
                              }
                            ),
                          ),

                          Center(
                            child: CustomCard(isSelect: value.isCard),
                          ),
                          Center(
                            child: CustomCard(isSelect: value.isCard),
                          ),
                          Center(
                            child: CustomCard(isSelect: value.isCard),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // second screen
              CustomSearch(
                controller: value.searchController,
                changeSearch: value.changeSearch,
                isSearch: value.isSearch
              ),

            ],
          );
        },

      );
    }
  }
