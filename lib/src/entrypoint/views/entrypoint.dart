import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/src/cart/views/cart_screen.dart';
import 'package:shoes_store/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:shoes_store/src/home/views/home.dart';
import 'package:shoes_store/src/profile/views/profile_screen.dart';
import 'package:shoes_store/src/wishlist/views/wishlist_screen.dart';

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({super.key});

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {

  final List<Widget> _page = [
    const HomeScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomTabNotifier>(
      builder: (context, value, child){
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              _page[context.watch<BottomTabNotifier>().selected],
              Align(
                alignment: const Alignment(0,1),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: GNav(
                    // color: Colors.grey.shade200,
                    // activeColor: Colors.grey.shade800,
                    gap: 8,
                    onTabChange: (index) =>
                    context.read<BottomTabNotifier>().changeSelected = index
                    ,
                    tabs:[
                      GButton(
                        icon: AntDesign.home,
                        text: "home",
                        iconColor: Colors.grey.shade200,
                        iconActiveColor: Colors.grey.shade800,

                      ),
                      GButton(
                        icon: Icons.favorite_border_outlined,
                        text: "wishlist",
                        iconColor: Colors.grey.shade200,
                        iconActiveColor: Colors.grey.shade800,
                      ),
                      GButton(
                        icon: Icons.shopping_bag_outlined,
                        text: "shopping",
                        leading: Badge(
                          label: Text("9"),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: value.selected == 2 ?
                            Colors.grey.shade800
                                :
                            Colors.grey.shade200
                            ,
                          ),
                        ),
                      ),
                      GButton(
                        icon: Icons.account_circle_outlined,
                        text: "account",
                        iconColor: Colors.grey.shade200,
                        iconActiveColor: Colors.grey.shade800,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}



