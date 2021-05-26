import 'package:flutter/material.dart';
import 'package:sirkadian_project/models/url_model.dart';
import 'package:sirkadian_project/widget_models/routeArgs.dart';

class DetailSFoodSayurScreen extends StatefulWidget {
  static const routeName = '/detailSfoodSayur_screen';
  DetailSFoodSayurScreen({
    Key key,
  }) : super(key: key);

  @override
  _DetailSFoodSayurScreenState createState() => _DetailSFoodSayurScreenState();
}

class _DetailSFoodSayurScreenState extends State<DetailSFoodSayurScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    final selectedSId = args.sayurRecom.firstWhere(
      (detailMeal) {
        return detailMeal.id == args.idSayur;
      },
    );

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${selectedSId.images}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                ),
                Positioned(
                  bottom: 7,
                  left: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      selectedSId.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 30, color: Colors.white),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.orange,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              'kalori',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.orange, fontSize: 15),
                            ),
                            Text(
                              selectedSId.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  Card(
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.orange,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              'protein',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.orange, fontSize: 15),
                            ),
                            Text(
                              selectedSId.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  Card(
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.orange,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              'lemak',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.orange, fontSize: 15),
                            ),
                            Text(
                              selectedSId.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'Bahan Makanan',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       gradient: LinearGradient(
                  //           colors: [Colors.teal, Colors.green])),
                  //   margin: EdgeInsets.all(10),
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: ListView.builder(
                  //     itemCount: selectedSId.foodIngredientsInfo.length,
                  //     itemBuilder: (ctx, idx) {
                  //       return Card(
                  //         color: Colors.grey,
                  //         child: ListTile(
                  //           leading: Text(
                  //             '${idx + 1}',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyText1
                  //                 .copyWith(color: Colors.white, fontSize: 20),
                  //           ),
                  //           title: Text(selectedSId
                  //               .foodIngredientsInfo[idx].ingredientsInfo),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    'Cara Memasak',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   margin: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       gradient: LinearGradient(
                  //           colors: [Colors.amber, Colors.orange])),
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: ListView.builder(
                  //     itemCount: selectedSId.foodInstructions.length,
                  //     itemBuilder: (ctx, idx) {
                  //       return Card(
                  //         color: Colors.grey,
                  //         child: ListTile(
                  //           leading: Text(
                  //             '${idx + 1}',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyText1
                  //                 .copyWith(color: Colors.white, fontSize: 20),
                  //           ),
                  //           title: Text(
                  //               selectedSId.foodInstructions[idx].instructions),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ));
  }
}

class DetailSFoodLaukScreen extends StatefulWidget {
  static const routeName = '/detailSfoodLauk_screen';
  DetailSFoodLaukScreen({
    Key key,
  }) : super(key: key);

  @override
  _DetailSFoodLaukScreenState createState() => _DetailSFoodLaukScreenState();
}

class _DetailSFoodLaukScreenState extends State<DetailSFoodLaukScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    final selectedLId = args.laukRecom.firstWhere(
      (detailMeal) {
        return detailMeal.id == args.idLauk;
      },
    );

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${selectedLId.images}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                ),
                Positioned(
                  bottom: 7,
                  left: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      selectedLId.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 30, color: Colors.white),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.orange,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              'kalori',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.orange, fontSize: 15),
                            ),
                            Text(
                              selectedLId.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  Card(
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.orange,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              'protein',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.orange, fontSize: 15),
                            ),
                            Text(
                              selectedLId.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  Card(
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.orange,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              'lemak',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.orange, fontSize: 15),
                            ),
                            Text(
                              selectedLId.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'Bahan Makanan',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       gradient: LinearGradient(
                  //           colors: [Colors.teal, Colors.green])),
                  //   margin: EdgeInsets.all(10),
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: ListView.builder(
                  //     itemCount: selectedSId.foodIngredientsInfo.length,
                  //     itemBuilder: (ctx, idx) {
                  //       return Card(
                  //         color: Colors.grey,
                  //         child: ListTile(
                  //           leading: Text(
                  //             '${idx + 1}',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyText1
                  //                 .copyWith(color: Colors.white, fontSize: 20),
                  //           ),
                  //           title: Text(selectedSId
                  //               .foodIngredientsInfo[idx].ingredientsInfo),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    'Cara Memasak',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   margin: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       gradient: LinearGradient(
                  //           colors: [Colors.amber, Colors.orange])),
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: ListView.builder(
                  //     itemCount: selectedSId.foodInstructions.length,
                  //     itemBuilder: (ctx, idx) {
                  //       return Card(
                  //         color: Colors.grey,
                  //         child: ListTile(
                  //           leading: Text(
                  //             '${idx + 1}',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyText1
                  //                 .copyWith(color: Colors.white, fontSize: 20),
                  //           ),
                  //           title: Text(
                  //               selectedSId.foodInstructions[idx].instructions),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ));
  }
}
