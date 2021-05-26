import 'package:flutter/material.dart';

class FlatButtons extends StatelessWidget {
  const FlatButtons({
    Key key,
    @required this.title,
    @required this.color,
    @required this.onpress,
  }) : super(key: key);

  final String title;
  final Color color;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontFamily: 'Nunito',
          fontSize: 15,
          fontStyle: FontStyle.normal,
          // fontWeight: FontWeight.bold
        ),
      ),
      onPressed: onpress,
    );
  }
}

class RaisedButtons extends StatelessWidget {
  const RaisedButtons({
    Key key,
    @required this.title,
    @required this.color,
    @required this.colorText,
    @required this.onpress,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color colorText;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      child: Text(
        title,
        style: TextStyle(
          color: colorText,
          fontFamily: 'Nunito',
          fontSize: 15,
          fontStyle: FontStyle.normal,
        ),
      ),
      onPressed: onpress,
    );
  }
}
