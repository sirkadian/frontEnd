import 'package:flutter/material.dart';
import 'package:sirkadian_project/widgets/button.dart';
import './register_screen.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/welcometitles.dart';
import '../../widgets/logo.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/bg2.png'),
                  fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              // ini title
              Container(
                height: height * 0.4,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20),
                child: WelcomeTitles(
                    title1: 'Jalan awalmu',
                    title2: 'menuju',
                    title3: 'hidup sehat'),
              ),
              //logo
              Container(
                  height: height * 0.1,
                  width: height * 0.35,
                  child: WhiteLogo()),
              //land of button
              Container(
                height: height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientButton(
                      color1: Color(0xFF004338),
                      color2: Color(0xFF28DE98),
                      color3: Color(0xFF28DE98),
                      buttontext: 'MASUK',
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      onpress: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                    ),
                    Text(
                      'atau',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white),
                    ),
                    GradientButton(
                      color1: Color(0xFF7F1E00),
                      color2: Color(0xFFFF8663),
                      color3: Color(0xFFFF8663),
                      buttontext: 'DAFTAR',
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      onpress: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),

              Container(
                height: height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  color: Color(0xFF7D1D00),
                    RaisedButtons(
                      onpress: () {},
                      color: Color(0xFF7D1D00),
                      title: 'Indonesia',
                      colorText: Color(0xFFF5FFF9),
                    ),
                    RaisedButtons(
                      onpress: () {},
                      color: Color(0xFFF5FFF9),
                      title: 'English',
                      colorText: Color(0xFF7D1D00),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
