// import 'package:flutter/material.dart';

// import 'package:sirkadian_project/models/food_models/foodRecomendation_model.dart';
// import 'package:sirkadian_project/models/food_models/food_model.dart';

// import 'package:sirkadian_project/screens/makan/foodRecom_screen.dart';
// import 'package:sirkadian_project/widget_models/routeArgs.dart';

// class FoodRecomItem extends StatefulWidget {
//   final List<LaukModel> laukRecom;
//   final List<SayurModel> sayurRecom;
//   final List<Post> allFood;
//   final List<SayurModel> listmakanSayur;

//   final String id;
//   final Color color;
//   final Color childColor;
//   final String title;
//   final IconData icon1;
//   final IconData icon2;
//   final IconData icon3;
//   const FoodRecomItem(
//       {Key key,
//       @required this.laukRecom,
//       @required this.sayurRecom,
//       @required this.allFood,
//       this.listmakanSayur,
//       this.id,
//       this.color = Colors.green,
//       this.childColor = Colors.grey,
//       this.title,
//       this.icon1 = Icons.add,
//       this.icon2 = Icons.check,
//       this.icon3 = Icons.shop})
//       : super(key: key);

//   @override
//   _FoodRecomItemState createState() => _FoodRecomItemState();
// }

// class _FoodRecomItemState extends State<FoodRecomItem> {
//   List<SayurModel> _listMakanSayur = [];
//   List<LaukModel> _listMakanLauk = [];

//   bool _isSayurSelected(String id) {
//     return _listMakanSayur.any((meal) => meal.id == id);
//   }

//   selectedFoodS(String sayurId) {
//     final existingIndex =
//         _listMakanSayur.indexWhere((sayur) => sayur.id == sayurId);
//     if (existingIndex >= 0) {
//       return showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: Text('makanan sudah dipilih'),
//                 // backgroundColor: Colors.grey,
//               ));
//     } else {
//       setState(() {
//         _listMakanSayur.add(
//           widget.sayurRecom.firstWhere((sayur) => sayur.id == sayurId),
//         );
//       });
//     }
//   }

//   removeListS(int idx) {
//     setState(() {
//       _listMakanSayur.removeWhere((remove) {
//         return remove.id == _listMakanSayur[idx].id;
//       });
//     });
//   }

//   removeListL(int idx) {
//     setState(() {
//       _listMakanLauk.removeWhere((remove) {
//         return remove.id == _listMakanLauk[idx].id;
//       });
//     });
//   }

//   Widget deleteBgList() {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: LinearGradient(
//               colors: [Colors.red.withOpacity(0.7), Colors.red])),
//       child: Icon(Icons.delete),
//     );
//   }

//   _showSnackBarS(context, idx, deletedItemS) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//         backgroundColor: Colors.deepOrange,
//         duration: Duration(milliseconds: 200),
//         content: Text(
//           '$deletedItemS telah dihapus',
//           style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12),
//         ),
//       ),
//     );
//   }

//   _showSnackBarL(context, idx, deletedItemL) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//         backgroundColor: Colors.deepOrange,
//         duration: Duration(milliseconds: 200),
//         content: Text(
//           '$deletedItemL telah dihapus',
//           style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(children: [
//         Container(
//           padding: EdgeInsets.only(left: 10, right: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             gradient: LinearGradient(
//                 colors: [widget.color, widget.color.withOpacity(0.7)],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Sarapan',
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline4
//                         .copyWith(fontSize: 25),
//                   ),
//                   IconButton(
//                     iconSize: 20,
//                     splashRadius: 20,
//                     color: Colors.blue,
//                     onPressed: () {},
//                     icon: Icon(
//                       widget.icon3,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Lauk'),
//                   IconButton(
//                     splashRadius: 20,
//                     onPressed: () async {
//                       await Future.delayed(Duration(milliseconds: 300));
//                       Navigator.of(context)
//                           .pushNamed(LaukRecomScreen.routeName,
//                               arguments: ScreenArguments(
//                                 allFood: widget.allFood,
//                                 // laukRecom: widget.laukRecom
//                               ))
//                           .then((result) {
//                         if (result != null) {
//                           setState(() {
//                             _listMakanLauk.add(result);
//                             print(result);
//                           });
//                         } else
//                           return;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               (_listMakanLauk.isEmpty)
//                   ? Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: LinearGradient(
//                             colors: [
//                               Colors.orange,
//                               Colors.orange.withOpacity(0.7)
//                             ],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight),
//                       ),
//                       height: 100,
//                       width: double.infinity,
//                     )
//                   : Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: LinearGradient(
//                             colors: [
//                               Colors.orange,
//                               Colors.orange.withOpacity(0.7)
//                             ],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight),
//                       ),
//                       height: 100,
//                       width: double.infinity,
//                       child: GridView.builder(
//                         scrollDirection: Axis.horizontal,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 1,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: _listMakanLauk.length,
//                         itemBuilder: (ctx, idx) {
//                           return Dismissible(
//                             background: deleteBgList(),
//                             direction: DismissDirection.up,
//                             key: Key(_listMakanLauk[idx].id),
//                             onDismissed: (direction) {
//                               var deletedItemL = _listMakanLauk[idx].name;
//                               _showSnackBarL(context, idx, deletedItemL);
//                               removeListL(idx);
//                             },
//                             child: GridTile(
//                               footer: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   _listMakanLauk[idx].name,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .subtitle2
//                                       .copyWith(
//                                           fontWeight: FontWeight.w800,
//                                           fontSize: 12),
//                                 ),
//                               ),
//                               child: ClipRRect(
//                                 child: Image.network(
//                                   '${_listMakanLauk[idx].images}',
//                                   fit: BoxFit.cover,
//                                   height: 50,
//                                   width: 60,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Sayur'),
//                   IconButton(
//                     splashRadius: 20,
//                     onPressed: () async {
//                       await Future.delayed(Duration(milliseconds: 300));
//                       print(widget.allFood);
//                       Navigator.of(context)
//                           .pushNamed(SayurRecomScreen.routeName,
//                               arguments: ScreenArguments(
//                                 isSelectedS: _isSayurSelected,
//                                 selectedFoodS: selectedFoodS,
//                                 allFood: widget.allFood,
//                                 // sayurRecom: widget.sayurRecom
//                               ))
//                           // Navigator.of(context)
//                           //     .push(MaterialPageRoute(
//                           //         builder: (context) => SayurRecomScreen(
//                           //               sayurRecomList: widget.sayurRecom,
//                           //               allfoods: widget.allFood,
//                           //             )))
//                           .then((result) {
//                         if (result != null) {
//                           setState(() {
//                             _listMakanSayur.add(result);
//                           });
//                         } else if (_listMakanSayur == result) return;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               (_listMakanSayur.isEmpty)
//                   ? Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: LinearGradient(
//                             colors: [
//                               Colors.orange,
//                               Colors.orange.withOpacity(0.7)
//                             ],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight),
//                       ),
//                       height: 100,
//                       width: double.infinity,
//                     )
//                   : Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: LinearGradient(
//                             colors: [
//                               Colors.orange,
//                               Colors.orange.withOpacity(0.7)
//                             ],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight),
//                       ),
//                       height: 100,
//                       width: double.infinity,
//                       child: GridView.builder(
//                         scrollDirection: Axis.horizontal,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 1,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: _listMakanSayur.length,
//                         itemBuilder: (ctx, idx) {
//                           return Dismissible(
//                             background: deleteBgList(),
//                             direction: DismissDirection.up,
//                             key: Key(_listMakanSayur[idx].id),
//                             onDismissed: (direction) {
//                               var deletedItemS = _listMakanSayur[idx].name;
//                               _showSnackBarS(context, idx, deletedItemS);
//                               removeListS(idx);
//                               // addListS(idx);
//                             },
//                             child: GridTile(
//                               footer: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   _listMakanSayur[idx].name,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .subtitle2
//                                       .copyWith(
//                                           fontWeight: FontWeight.w800,
//                                           fontSize: 12),
//                                 ),
//                               ),
//                               child: ClipRRect(
//                                 child: Image.network(
//                                   '${_listMakanSayur[idx].images}',
//                                   fit: BoxFit.cover,
//                                   height: 50,
//                                   width: 60,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//               SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
