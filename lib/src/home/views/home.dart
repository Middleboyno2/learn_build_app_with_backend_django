import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/src/home/controllers/home_notifier.dart';
import 'package:shoes_store/src/home/widgets/custom_app_bar.dart';
import 'package:shoes_store/src/home/widgets/search.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (BuildContext context, HomeNotifier value, Widget? child) {
        return Stack(
          children: [
            // first screen
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: CustomAppBar(
                  isSearch: value.isSearch,
                  changeSearch: value.changeSearch,
                ),
              ),
              body: Center(
                child: Text("Home Page"),
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
