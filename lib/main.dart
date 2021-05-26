import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sirkadian_project/screens/auth_screen/userActivation_screen.dart';
import 'package:sirkadian_project/screens/makan/foodRecommendation_screen.dart';
import './screens/auth_screen/initialSetup_screen.dart';

import './screens/makan/detail_makan_screen.dart';

import './screens/makan/mainFood_screen.dart';
import './screens/tabs_screen.dart';

import 'screens/auth_screen/forgetpass_screen.dart';
import 'screens/auth_screen/login_screen.dart';
import 'screens/auth_screen/register_screen.dart';
import 'screens/auth_screen/welcome_screen.dart';

void main() {
  int a = 5;
  print(a);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    //sementara dibuat portrait dulu soalnya perhitungan landscape masih kacau
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Color(0xFFFFFFFF),
        primaryColor: Color(0xFF28DF99),
        // primaryColor: Colors.black,
        // accentColor: Colors.black,
        accentColor: Color(0xFF28DF99),
        secondaryHeaderColor: Color(0xFFFF8663),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  // fontStyle: FontStyle.italic,
                  color: Colors.black),
              headline2: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
              headline3: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  // fontStyle: FontStyle.italic,
                  color: Colors.black),
              headline4: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  // fontStyle: FontStyle.italic,
                  color: Colors.black),
              bodyText1: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito',
                fontSize: 15,
                fontStyle: FontStyle.normal,
                // fontWeight: FontWeight.bold
              ),
              subtitle1: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              subtitle2: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito',
                fontSize: 15,
                fontStyle: FontStyle.normal,
              ),
            ),
      ),
      home: WelcomeScreen(),
      // home: TabsScreen(),

      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        InitialSetupScreen.routeName: (ctx) => InitialSetupScreen(),
        UserActivationScreen.routeName: (ctx) => UserActivationScreen(),
        ForgetPassScreen.routeName: (ctx) => ForgetPassScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        MainFoodScreen.routeName: (ctx) => MainFoodScreen(),
        FoodRecomScreen.routeName: (ctx) => FoodRecomScreen(),
        DetailSFoodSayurScreen.routeName: (ctx) => DetailSFoodSayurScreen(),
        DetailSFoodLaukScreen.routeName: (ctx) => DetailSFoodLaukScreen(),
      },
      // home: MakanScreen(),
    );
  }
}
