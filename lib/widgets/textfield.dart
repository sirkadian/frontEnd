import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {Key key,
      @required this.title,
      @required this.color,
      this.icon,
      this.controller})
      : super(key: key);
  final String title;
  final Color color;
  final Icon icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 18, color: color, decorationColor: color),
        decoration: InputDecoration(
          icon: icon,
          hintText: title,
        ),
      ),
    );
  }
}

class PassTextFields extends StatelessWidget {
  const PassTextFields(
      {Key key, @required this.title, this.color, this.controller})
      : super(key: key);
  final String title;
  final Color color;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: true,
        style: TextStyle(fontSize: 18, color: color, decorationColor: color),
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: title,
        ),
      ),
    );
  }
}
