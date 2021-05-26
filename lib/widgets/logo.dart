import 'package:flutter/material.dart';

class WhiteLogo extends StatelessWidget {
  const WhiteLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      // width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sirkadianlogowhite.png'),
              fit: BoxFit.fill)),
    );
  }
}

class GreenLogo extends StatelessWidget {
  const GreenLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      // width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sirkadianlogo.png'),
              fit: BoxFit.fill)),
    );
  }
}
