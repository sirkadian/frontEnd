import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import '../proper_widgets/loader.dart';
// import '../models/foodRecomendation_model.dart';
// import '../models/food_model.dart';
// import '../models/url_model.dart';

import '../screens/home_screen.dart';
import '../screens/makan/mainFood_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  final String authToken;
  TabsScreen({
    Key key,
    this.authToken,
  }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    _screens = [
      {
        'screen': HomeScreen(
          authToken: widget.authToken,
          // allFoods: _allFoods,
        ),
        'title': 'Sirkadian',
      },
      {
        'screen': MainFoodScreen(
            // allFoods: _allFoods,
            // foodsSayur: _foodsSayur,
            // foodsLauk: _foodsLauk,
            ),
        'title': 'Sirka-Food',
      },
    ];
    // _fetchData();
    super.initState();
  }

  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 40,
      backgroundColor: Colors.white,
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       color: Colors.black,
      //       icon: const Icon(Icons.person),
      //       onPressed: () {},
      //     );
      //   },
      // ),
      leadingWidth: 5,
      leading: Container(),
      // centerTitle: true,
      title: Text(
        _screens[_selectedScreenIndex]['title'],
        style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            // fontStyle: FontStyle.italic,
            color: Colors.black),
      ),
      actions: [
        (_selectedScreenIndex < 1)
            ? Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: FaIcon(
                      FontAwesomeIcons.shoppingBasket,
                      size: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: FaIcon(
                      FontAwesomeIcons.userAlt,
                      size: 20,
                    ),
                  )
                ],
              )
            : Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.bars,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.history,
                      size: 20,
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Makan',
              backgroundColor: Colors.white),
        ],
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 30, 30, 30),
      //   buttonBackgroundColor: Colors.green[300],
      //   color: Colors.black,
      //   height: size.height * 0.1,
      //   items: <Widget>[
      //     Column(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(
      //           Icons.home,
      //           size: 25,
      //           color: Colors.white,
      //         ),
      //         Text(
      //           'Beranda',
      //           style:
      //               Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 7),
      //         ),
      //       ],
      //     ),
      //     Column(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(
      //           Icons.restaurant_menu,
      //           size: 25,
      //           color: Colors.white,
      //         ),
      //         Text(
      //           'Makan',
      //           style:
      //               Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 7),
      //         ),
      //       ],
      //     ),
      //   ],
      //   onTap: _selectedScreen,
      // ),
    );
  }
}
