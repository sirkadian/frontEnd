import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.buttontext,
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.onpress,
    this.padding,
  }) : super(key: key);
  final String buttontext;
  final Color color1;
  final Color color2;
  final Color color3;
  final Function onpress;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpress,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: <Color>[
                  color1,
                  color2,
                  color3,
                ],
              )),
          child: Text(buttontext,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white)),
        ));
  }
}

class GradientIconButton extends StatelessWidget {
  const GradientIconButton({
    Key key,
    @required this.icon,
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.onpress,
    this.padding,
  }) : super(key: key);
  final Icon icon;
  final Color color1;
  final Color color2;
  final Color color3;
  final Function onpress;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: <Color>[
                color1,
                color2,
                color3,
              ],
            )),
        child: TextButton(
          onPressed: onpress,
          child: icon,
        ));
  }
}
