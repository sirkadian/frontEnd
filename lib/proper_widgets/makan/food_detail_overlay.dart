import 'package:flutter/material.dart';

import '../../widgets/gradient_button.dart';

class FoodDetailScreen extends StatelessWidget {
  final String detail;
  final String calorie;
  final String protein;
  final String fat;
  final Function tombolresep;
  final Function tombolganti;

  const FoodDetailScreen({
    Key key,
    @required this.detail,
    @required this.calorie,
    @required this.protein,
    @required this.fat,
    this.tombolresep,
    this.tombolganti,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    final double width = (MediaQuery.of(context).size.width);

    return Container(
      width: width,
      height: (height + MediaQuery.of(context).padding.top) * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          image: DecorationImage(
              image: AssetImage('assets/images/bg3.png'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            detail,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: height * 0.02),
          Text('calorie   :' + calorie),
          Text('protein   :' + protein),
          Text('fat        :' + fat),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GradientIconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                color1: Color(0xFF7F1E00),
                color2: Color(0xFFFF8663),
                color3: Color(0xFFFF8663),
                onpress: () {},
                //belum dibuat hapusnya
              ),
              GradientButton(
                buttontext: 'Lihat Resep',
                color1: Color(0xFF004338),
                color2: Color(0xFF28DE98),
                color3: Color(0xFF28DE98),
                onpress: tombolresep,
              ),
              // GradientIconButton(
              //   icon: Icon(
              //     Icons.add,
              //     color: Colors.white,
              //   ),
              //   color1: Color(0xFF004338),
              //   color2: Color(0xFF28DE98),
              //   color3: Color(0xFF28DE98),
              // onpress: tombolganti,
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class FoodDetailScreen1 extends StatelessWidget {
  final String detail;
  final String calorie;
  final String protein;
  final String fat;
  final Function tombolresep;
  final Function tombolganti;

  const FoodDetailScreen1({
    Key key,
    @required this.detail,
    @required this.calorie,
    @required this.protein,
    @required this.fat,
    this.tombolresep,
    this.tombolganti,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    final double width = (MediaQuery.of(context).size.width);

    return Container(
      width: width,
      height: (height + MediaQuery.of(context).padding.top) * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          image: DecorationImage(
              image: AssetImage('assets/images/bg3.png'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            detail,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: height * 0.02),
          Text('calorie   :' + calorie),
          Text('protein   :' + protein),
          Text('fat        :' + fat),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GradientIconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                color1: Color(0xFF004338),
                color2: Color(0xFF28DE98),
                color3: Color(0xFF28DE98),
                onpress: () {},
              ),
              GradientButton(
                buttontext: 'Lihat Resep',
                color1: Color(0xFF004338),
                color2: Color(0xFF28DE98),
                color3: Color(0xFF28DE98),
                onpress: tombolresep,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
