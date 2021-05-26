import 'package:flutter/material.dart';

class CheckListMakan extends StatelessWidget {
  const CheckListMakan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final double height = (MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top);
    final double width = (MediaQuery.of(context).size.width);

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          width: width * 0.7,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(7),
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF28DF99),
                  Color(0xFFFF8663),
                ],
              )),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: width * 0.2,
              width: width * 0.2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pagi',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: width * 0.07,
                  )
                ],
              ),
            ),
            Container(
              height: width * 0.2,
              width: width * 0.2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Siang',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: width * 0.07,
                  )
                ],
              ),
            ),
            Container(
              height: width * 0.2,
              width: width * 0.2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Malam',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: width * 0.07,
                  )
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
