import 'package:flutter/material.dart';

class FoodRecomWidgetModel {
  final String id;
  final Color color;
  final String title;
  final IconData icon1;
  final IconData icon2;
  final Color childColor;
  final IconData icon3;

  const FoodRecomWidgetModel({
    @required this.id,
    @required this.color,
    @required this.childColor,
    @required this.title,
    @required this.icon1,
    @required this.icon2,
    @required this.icon3,
  });
}

const FoodRecomWidgetModelList = const [
  FoodRecomWidgetModel(
      id: '1',
      title: 'Sarapan',
      color: Colors.green,
      childColor: Color.fromARGB(255, 30, 30, 30),
      icon1: Icons.add,
      icon2: Icons.check,
      icon3: Icons.replay),
  FoodRecomWidgetModel(
    id: '2',
    title: 'Makan Siang',
    color: Colors.yellow,
    childColor: Color.fromARGB(255, 30, 30, 30),
    icon1: Icons.add,
    icon2: Icons.check,
    icon3: Icons.replay,
  ),
  FoodRecomWidgetModel(
    id: '3',
    title: 'Makan Malam',
    color: Colors.orange,
    childColor: Color.fromARGB(255, 30, 30, 30),
    icon1: Icons.add,
    icon2: Icons.check,
    icon3: Icons.replay,
  ),
];
