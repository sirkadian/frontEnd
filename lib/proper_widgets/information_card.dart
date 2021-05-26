import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final double height = (MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top);
    final double width = (MediaQuery.of(context).size.width);

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(7),
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF28DF99),
                  Color(0xFFFF8663),
                ],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: width * 0.15,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      Text(
                        '2000',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 10),
                      ),
                      Text(
                        'kkal',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 7),
                      )
                    ],
                  )),
              Container(
                  width: width * 0.15,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.directions_run,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      Text(
                        '100',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 10),
                      ),
                      Text(
                        'kkal',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 7),
                      )
                    ],
                  )),
              Container(
                  width: width * 0.15,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.nights_stay,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      Text(
                        '6',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 10),
                      ),
                      Text(
                        'jam',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 7),
                      )
                    ],
                  )),
              Container(
                  width: width * 0.15,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.face_retouching_natural,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      Text(
                        'Mood',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 10),
                      ),
                      Text(
                        'Baik',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 7),
                      )
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
