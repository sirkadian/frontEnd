import 'package:flutter/material.dart';
import '../../screens/makan/detail_makan_screen.dart';
import '../../widget_models/routeArgs.dart';

class FoodRecomScreen extends StatefulWidget {
  static const routeName = '/foodRecommendation_screen';

  // final Function selectedFoodS;
  // final Function iconShowed;

  FoodRecomScreen({
    Key key,
    // this.selectedFoodS,
    // this.iconShowed,
  }) : super(key: key);

  @override
  _FoodRecomScreenState createState() => _FoodRecomScreenState();
}

class _FoodRecomScreenState extends State<FoodRecomScreen> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5FFF9),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Rekomendasi',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 40)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 40,
                    )),
              ],
            ),
            Container(
              color: Colors.grey.withOpacity(0.3),
              child: ToggleButtons(
                renderBorder: false,
                selectedColor: Colors.black,
                // disabledColor: Colors.white,
                fillColor: Colors.grey.withOpacity(0.5),
                hoverColor: Colors.white,
                color: Colors.black38,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Lauk')),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Sayur')),
                ],
                isSelected: isSelected,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                      } else
                        isSelected[index] = false;
                    }
                  });
                },
              ),
            ),
            (isSelected[0])
                ? Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: args.laukRecom.length,
                      itemBuilder: (ctx, idx) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print(args.laukRecom);
                                Navigator.of(context)
                                    .pushNamed(DetailSFoodLaukScreen.routeName,
                                        arguments: ScreenArguments(
                                          allFood: args.allFood,
                                          laukRecom: args.laukRecom,
                                          idLauk: args.laukRecom[idx].id,
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFFF5C2C),
                                      Color(0xFFFF8663),
                                    ])),
                                child: Row(
                                  children: [
                                    FadeInImage(
                                      placeholder: AssetImage(
                                          'assets/images/uploadFoto.png'),
                                      image: NetworkImage(
                                          '${args.laukRecom[idx].images}'),
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            args.laukRecom[idx].name,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              ),
                                              Text(
                                                args.laukRecom[idx].rekomendasi
                                                    .toStringAsFixed(0),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 20,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        args.selectedFoodL(
                                            args.laukRecom[idx].id);
                                      },
                                      icon: Icon(args.isSelectedL(
                                              args.laukRecom[idx].id)
                                          ? Icons.check
                                          : Icons.add),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                : Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: args.sayurRecom.length,
                      itemBuilder: (ctx, idx) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(DetailSFoodSayurScreen.routeName,
                                        arguments: ScreenArguments(
                                          allFood: args.allFood,
                                          sayurRecom: args.sayurRecom,
                                          idSayur: args.sayurRecom[idx].id,
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF28DF99),
                                      Color(0xFF99F3BD),
                                    ])),
                                child: Row(
                                  children: [
                                    FadeInImage(
                                      placeholder: AssetImage(
                                          'assets/images/uploadFoto.png'),
                                      image: NetworkImage(
                                          '${args.sayurRecom[idx].images}'),
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            args.sayurRecom[idx].name,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              ),
                                              Text(
                                                args.sayurRecom[idx].rekomendasi
                                                    .toStringAsFixed(0),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 20,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        args.selectedFoodS(
                                            args.sayurRecom[idx].id);
                                      },
                                      icon: Icon(args.isSelectedS(
                                              args.sayurRecom[idx].id)
                                          ? Icons.check
                                          : Icons.add),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
