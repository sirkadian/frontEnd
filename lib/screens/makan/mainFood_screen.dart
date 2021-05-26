import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sirkadian_project/controller/foods_controller.dart';

import 'package:sirkadian_project/models/food_models/foodRecomendation_model.dart';
import 'package:sirkadian_project/models/food_models/food_model.dart';

import 'package:sirkadian_project/proper_widgets/loader.dart';

import 'package:sirkadian_project/screens/makan/foodRecommendation_screen.dart';
import 'package:sirkadian_project/widget_models/routeArgs.dart';

import '../../models/food_models/foodRecomendation_model.dart';

// ignore: must_be_immutable
class MainFoodScreen extends StatefulWidget {
  static const routeName = '/mainFood_screen';

  MainFoodScreen({
    Key key,
  }) : super(key: key);

  @override
  _MainFoodScreenState createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  final FoodsController foodsController = Get.put(FoodsController());

  int _index = 0;
  List<FoodRecomModel> listSarapan = [];
  List<FoodRecomModel> listMakanSiang = [];
  List<FoodRecomModel> listMakanMalam = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5FFF9),
      body: Stack(children: [
        SingleChildScrollView(
          child: Obx(
            // init: FoodsController(),
            () => foodsController.isLoading.value
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorLoader5(),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      FoodCheckList(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: size.height * 0.1,
                        width: size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              foregroundColor: Colors.black,
                              radius: size.width * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(foodsController
                                      .foodNecessityModel.calorie
                                      .toStringAsFixed(0)),
                                  Text(
                                    'Kalori',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              foregroundColor: Colors.black,
                              radius: size.width * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(foodsController
                                      .foodNecessityModel.protein
                                      .toStringAsFixed(0)),
                                  Text('Protein',
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              foregroundColor: Colors.black,
                              radius: size.width * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(foodsController.foodNecessityModel.fat
                                      .toStringAsFixed(0)),
                                  Text('Lemak', style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              foregroundColor: Colors.black,
                              radius: size.width * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(foodsController
                                      .foodNecessityModel.carbohydrate
                                      .toStringAsFixed(0)),
                                  Text('Karbohidrat',
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              foregroundColor: Colors.black,
                              radius: size.width * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(foodsController.foodNecessityModel.iron
                                      .toStringAsFixed(0)),
                                  Text('Zat Besi',
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              foregroundColor: Colors.black,
                              radius: size.width * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(foodsController
                                      .foodNecessityModel.calcium
                                      .toStringAsFixed(0)),
                                  Text('Kalsium',
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      // GetBuilder<FoodsController>(
                      //   builder: (_foodsController) =>
                      Container(
                        height: size.height * 0.55,
                        child: PageView(
                            controller: PageController(viewportFraction: 0.9),
                            onPageChanged: (int index) =>
                                setState(() => _index = index),
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              MainFoodWidgetPagi(
                                foodsLauk: foodsController.foodsLauk,
                                allFoods: foodsController.allFoodsList,
                                foodsSayur: foodsController.foodsSayur,
                                listSarapan: listSarapan,
                              ),
                              MainFoodWidgetSiang(
                                foodsLauk: foodsController.foodsLauk,
                                allFoods: foodsController.allFoodsList,
                                foodsSayur: foodsController.foodsSayur,
                                listMakanSiang: listMakanSiang,
                              ),
                              MainFoodWidgetMalam(
                                foodsLauk: foodsController.foodsLauk,
                                allFoods: foodsController.allFoodsList,
                                foodsSayur: foodsController.foodsSayur,
                                listMakanMalam: listMakanMalam,
                              ),
                            ]),
                      ),
                      // ),
                    ],
                  ),
          ),
        )
      ]),
    );
  }
}

class MainFoodWidgetPagi extends StatefulWidget {
  final List<FoodRecomModel> listSarapan;
  final List<FoodRecomModel> foodsSayur;
  final List<FoodRecomModel> foodsLauk;
  final List<AllFoodResponse> allFoods;
  const MainFoodWidgetPagi({
    Key key,
    @required this.foodsLauk,
    @required this.listSarapan,
    @required this.foodsSayur,
    @required this.allFoods,
  }) : super(key: key);

  @override
  _MainFoodWidgetPagiState createState() => _MainFoodWidgetPagiState();
}

class _MainFoodWidgetPagiState extends State<MainFoodWidgetPagi> {
  _selectedFoodS(String sayurId) {
    final existingIndex =
        widget.listSarapan.indexWhere((sayur) => sayur.id == sayurId);
    if (existingIndex >= 0) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('makanan sudah dipilih'),
                // backgroundColor: Colors.grey,
              ));
    } else {
      setState(() {
        widget.listSarapan.add(
          widget.foodsSayur.firstWhere((sarapan) => sarapan.id == sayurId),
        );
      });
    }
  }

  _selectedFoodL(String laukId) {
    final existingIndex =
        widget.listSarapan.indexWhere((lauk) => lauk.id == laukId);
    if (existingIndex >= 0) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('makanan sudah dipilih'),
                // backgroundColor: Colors.grey,
              ));
    } else {
      setState(() {
        widget.listSarapan.add(
          widget.foodsLauk.firstWhere((sarapan) => sarapan.id == laukId),
        );
      });
    }
  }

  bool _isSayurSelected(String id) {
    return widget.listSarapan.any((meal) => meal.id == id);
  }

  bool _isLaukSelected(String id) {
    return widget.listSarapan.any((meal) => meal.id == id);
  }

  removeList(int idx) {
    setState(() {
      widget.listSarapan.removeWhere((remove) {
        return remove.id == widget.listSarapan[idx].id;
      });
    });
  }

  Widget deleteBgList() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.red.withOpacity(0.7), Colors.red])),
      child: Icon(Icons.delete),
    );
  }

  _showSnackBar(context, idx, deletedItemS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        backgroundColor: Colors.deepOrange,
        duration: Duration(milliseconds: 200),
        content: Text(
          '$deletedItemS telah dihapus',
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF28DF99),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sarapan',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  children: [
                    GetBuilder<FoodsController>(
                        builder: (_foodsController) => IconButton(
                              splashRadius: 20,
                              onPressed: () async {
                                await Future.delayed(
                                    Duration(milliseconds: 300));
                                Navigator.of(context).pushNamed(
                                    FoodRecomScreen.routeName,
                                    arguments: ScreenArguments(
                                      isSelectedL: _isLaukSelected,
                                      isSelectedS: _isSayurSelected,
                                      selectedFoodS: _selectedFoodS,
                                      selectedFoodL: _selectedFoodL,
                                      allFood: _foodsController.allFoodsList,
                                      sayurRecom: _foodsController.foodsSayur,
                                      laukRecom: _foodsController.foodsLauk,
                                    ));
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            )),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.north_east_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            (widget.listSarapan.isEmpty)
                ? Container(
                    height: size.height * 0.4,
                    alignment: Alignment.center,
                    child: Text('Tambahkan Sarapan',
                        style: Theme.of(context).textTheme.subtitle1),
                  )
                : Container(
                    height: size.height * 0.4,
                    child: ListView.builder(
                        itemCount: widget.listSarapan.length,
                        itemBuilder: (ctx, idx) {
                          return Dismissible(
                            background: deleteBgList(),
                            direction: DismissDirection.startToEnd,
                            key: Key(widget.listSarapan[idx].id.toString()),
                            onDismissed: (direction) {
                              var deletedItemL = widget.listSarapan[idx].name;
                              _showSnackBar(context, idx, deletedItemL);
                              removeList(idx);
                            },
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      '${widget.listSarapan[idx].images}',
                                      fit: BoxFit.cover,
                                      height: size.height * 0.15,
                                      width: size.width * 0.3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(widget.listSarapan[idx].name),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            widget.listSarapan[idx].rekomendasi
                                                .toStringAsFixed(0),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}

class MainFoodWidgetSiang extends StatefulWidget {
  final List<FoodRecomModel> listMakanSiang;
  final List<FoodRecomModel> foodsSayur;
  final List<FoodRecomModel> foodsLauk;
  final List<AllFoodResponse> allFoods;
  const MainFoodWidgetSiang({
    Key key,
    @required this.foodsLauk,
    @required this.listMakanSiang,
    @required this.foodsSayur,
    @required this.allFoods,
  }) : super(key: key);

  @override
  _MainFoodWidgetSiangState createState() => _MainFoodWidgetSiangState();
}

class _MainFoodWidgetSiangState extends State<MainFoodWidgetSiang> {
  _selectedFoodS(String sayurId) {
    final existingIndex =
        widget.listMakanSiang.indexWhere((sayur) => sayur.id == sayurId);
    if (existingIndex >= 0) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('makanan sudah dipilih'),
                // backgroundColor: Colors.grey,
              ));
    } else {
      setState(() {
        widget.listMakanSiang.add(
          widget.foodsSayur.firstWhere((sarapan) => sarapan.id == sayurId),
        );
      });
    }
  }

  _selectedFoodL(String laukId) {
    final existingIndex =
        widget.listMakanSiang.indexWhere((lauk) => lauk.id == laukId);
    if (existingIndex >= 0) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('makanan sudah dipilih'),
                // backgroundColor: Colors.grey,
              ));
    } else {
      setState(() {
        widget.listMakanSiang.add(
          widget.foodsLauk.firstWhere((sarapan) => sarapan.id == laukId),
        );
      });
    }
  }

  bool _isSayurSelected(String id) {
    return widget.listMakanSiang.any((meal) => meal.id == id);
  }

  bool _isLaukSelected(String id) {
    return widget.listMakanSiang.any((meal) => meal.id == id);
  }

  removeList(int idx) {
    setState(() {
      widget.listMakanSiang.removeWhere((remove) {
        return remove.id == widget.listMakanSiang[idx].id;
      });
    });
  }

  Widget deleteBgList() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.red.withOpacity(0.7), Colors.red])),
      child: Icon(Icons.delete),
    );
  }

  _showSnackBar(context, idx, deletedItemS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        backgroundColor: Colors.deepOrange,
        duration: Duration(milliseconds: 200),
        content: Text(
          '$deletedItemS telah dihapus',
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFB6EECD),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Makan Siang',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  children: [
                    GetBuilder<FoodsController>(
                        builder: (_foodsController) => IconButton(
                            splashRadius: 20,
                            onPressed: () async {
                              await Future.delayed(Duration(milliseconds: 300));
                              Navigator.of(context)
                                  .pushNamed(FoodRecomScreen.routeName,
                                      arguments: ScreenArguments(
                                        isSelectedL: _isLaukSelected,
                                        isSelectedS: _isSayurSelected,
                                        selectedFoodS: _selectedFoodS,
                                        selectedFoodL: _selectedFoodL,
                                        allFood: _foodsController.allFoodsList,
                                        sayurRecom: _foodsController.foodsSayur,
                                        laukRecom: _foodsController.foodsLauk,
                                      ));
                            },
                            icon: Icon(Icons.add))),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.north_east_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            (widget.listMakanSiang.isEmpty)
                ? Container(
                    height: size.height * 0.4,
                    alignment: Alignment.center,
                    child: Text('Tambahkan Makan Siang',
                        style: Theme.of(context).textTheme.subtitle1),
                  )
                : Container(
                    height: size.height * 0.4,
                    child: ListView.builder(
                        itemCount: widget.listMakanSiang.length,
                        itemBuilder: (ctx, idx) {
                          return Dismissible(
                            background: deleteBgList(),
                            direction: DismissDirection.startToEnd,
                            key: Key(widget.listMakanSiang[idx].id.toString()),
                            onDismissed: (direction) {
                              var deletedItemL =
                                  widget.listMakanSiang[idx].name;
                              _showSnackBar(context, idx, deletedItemL);
                              removeList(idx);
                            },
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.white.withOpacity(0.5))),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      '${widget.listMakanSiang[idx].images}',
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 120,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(widget.listMakanSiang[idx].name)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}

class MainFoodWidgetMalam extends StatefulWidget {
  final List<FoodRecomModel> listMakanMalam;
  final List<FoodRecomModel> foodsSayur;
  final List<FoodRecomModel> foodsLauk;
  final List<AllFoodResponse> allFoods;
  const MainFoodWidgetMalam({
    Key key,
    @required this.foodsLauk,
    @required this.listMakanMalam,
    @required this.foodsSayur,
    @required this.allFoods,
  }) : super(key: key);

  @override
  _MainFoodWidgetMalamState createState() => _MainFoodWidgetMalamState();
}

class _MainFoodWidgetMalamState extends State<MainFoodWidgetMalam> {
  _selectedFoodS(String sayurId) {
    final existingIndex =
        widget.listMakanMalam.indexWhere((sayur) => sayur.id == sayurId);
    if (existingIndex >= 0) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('makanan sudah dipilih'),
                // backgroundColor: Colors.grey,
              ));
    } else {
      setState(() {
        widget.listMakanMalam.add(
          widget.foodsSayur
              .firstWhere((makanMalam) => makanMalam.id == sayurId),
        );
      });
    }
  }

  _selectedFoodL(String laukId) {
    final existingIndex =
        widget.listMakanMalam.indexWhere((lauk) => lauk.id == laukId);
    if (existingIndex >= 0) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('makanan sudah dipilih'),
              ));
    } else {
      setState(() {
        widget.listMakanMalam.add(
          widget.foodsLauk.firstWhere((MakanMalam) => MakanMalam.id == laukId),
        );
      });
    }
  }

  bool _isSayurSelected(String id) {
    return widget.listMakanMalam.any((meal) => meal.id == id);
  }

  bool _isLaukSelected(String id) {
    return widget.listMakanMalam.any((meal) => meal.id == id);
  }

  removeList(int idx) {
    setState(() {
      widget.listMakanMalam.removeWhere((remove) {
        return remove.id == widget.listMakanMalam[idx].id;
      });
    });
  }

  Widget deleteBgList() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.red.withOpacity(0.7), Colors.red])),
      child: Icon(Icons.delete),
    );
  }

  _showSnackBar(context, idx, deletedItemS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        backgroundColor: Colors.deepOrange,
        duration: Duration(milliseconds: 200),
        content: Text(
          '$deletedItemS telah dihapus',
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFF8663),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Makan Malam',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  children: [
                    GetBuilder<FoodsController>(
                        builder: (_foodsController) => IconButton(
                            splashRadius: 20,
                            onPressed: () async {
                              await Future.delayed(Duration(milliseconds: 300));
                              Navigator.of(context)
                                  .pushNamed(FoodRecomScreen.routeName,
                                      arguments: ScreenArguments(
                                        isSelectedL: _isLaukSelected,
                                        isSelectedS: _isSayurSelected,
                                        selectedFoodS: _selectedFoodS,
                                        selectedFoodL: _selectedFoodL,
                                        allFood: _foodsController.allFoodsList,
                                        sayurRecom: _foodsController.foodsSayur,
                                        laukRecom: _foodsController.foodsLauk,
                                      ));
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ))),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.north_east_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            (widget.listMakanMalam.isEmpty)
                ? Container(
                    height: size.height * 0.4,
                    alignment: Alignment.center,
                    child: Text('Tambahkan Makan Malam',
                        style: Theme.of(context).textTheme.subtitle1),
                  )
                : Container(
                    height: size.height * 0.4,
                    child: ListView.builder(
                        itemCount: widget.listMakanMalam.length,
                        itemBuilder: (ctx, idx) {
                          return Dismissible(
                            background: deleteBgList(),
                            direction: DismissDirection.startToEnd,
                            key: Key(widget.listMakanMalam[idx].id.toString()),
                            onDismissed: (direction) {
                              var deletedItemL =
                                  widget.listMakanMalam[idx].name;
                              _showSnackBar(context, idx, deletedItemL);
                              removeList(idx);
                            },
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.white.withOpacity(0.5))),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      '${widget.listMakanMalam[idx].images}',
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 120,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(widget.listMakanMalam[idx].name)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}

class FoodCheckList extends StatelessWidget {
  const FoodCheckList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 85,
        width: 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: <Color>[
            Color(0xFF28DF99),
            Color(0xFFFF8663),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pagi',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Siang',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Malam',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
