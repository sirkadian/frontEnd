import 'package:flutter/material.dart';

class WelcomeTitles extends StatelessWidget {
  const WelcomeTitles({
    Key key,
    @required this.title1,
    @required this.title2,
    @required this.title3,
  }) : super(key: key);
  final String title1;
  final String title2;
  final String title3;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(color: Colors.white),
        ),
        Text(
          title2,
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(color: Colors.white),
        ),
        Text(
          title3,
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Colors.white),
        ),
      ],
    ));
  }
}
