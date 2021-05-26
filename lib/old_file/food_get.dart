// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:sirkadian_project/screens/food_recipe_screen.dart';
// // import 'package:sirkadian_project/screens/food_recipe_screen.dart';
// import '../models/food_detail_model.dart';
// import '../models/food_model.dart';
// import 'loader.dart';
// import 'package:http/http.dart' as http;
// // import 'package:testing/httptesting_detail/detail.dart';

// // import 'package:testing/httptesting_list/http_service.dart';

// class FoodsPage extends StatefulWidget {
//   @override
//   _FoodsPageState createState() => _FoodsPageState();
// }

// class _FoodsPageState extends State<FoodsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder(
//         future: Post.getFoods(),
//         builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//           if (snapshot.hasData) {
//             List<Post> foods = snapshot.data;

//             return ListView.builder(
//               itemCount: foods.length,
//               itemBuilder: (ctx, idx) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.transparent,
//                       border: Border.all(width: 1, color: Colors.white)),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Text(foods[idx].id)),
//                     title: Text(
//                       foods[idx].name,
//                       style: Theme.of(context).textTheme.bodyText1,
//                     ),
//                     subtitle: Text(
//                       foods[idx].duration +
//                           ' menit' +
//                           ' | ' +
//                           foods[idx].calorie.toString() +
//                           ' kkal' +
//                           ' | ' +
//                           foods[idx].foodType,
//                       style: Theme.of(context).textTheme.bodyText2,
//                     ),
//                     onTap: () {
//                       showModalBottomSheet(
//                           isScrollControlled: true,
//                           context: context,
//                           enableDrag: false,
//                           backgroundColor: Colors.transparent,
//                           builder: (_) {
//                             return GestureDetector(
//                               behavior: HitTestBehavior.opaque,
//                               onTap: () {},
//                               child: FoodDetailScreen(
//                                 tombol: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => FoodRecipeScreen(
//                                               recipe:
//                                                   foods[idx].foodIngridientInfo,
//                                             )),
//                                   );
//                                 },
//                                 detail: foods[idx].name,
//                                 calorie: foods[idx].calorie.toString(),
//                                 protein: foods[idx].protein.toString(),
//                                 fat: foods[idx].fat.toString(),
//                               ),
//                             );
//                           });
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//           return Container(
//             alignment: Alignment.topCenter,
//             //     child: CircularProgressIndicator(
//             //   backgroundColor: Colors.green,
//             // )
//             child: ColorLoader5(),
//           );
//         },
//       ),
//     );
//   }
// }

// //
// //untuk menampilkan rekomendasi pada makanscreen

// class FoodsRecom extends StatefulWidget {
//   @override
//   _FoodsRecomState createState() => _FoodsRecomState();
// }

// class _FoodsRecomState extends State<FoodsRecom> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder(
//         future: Post.getFoods(),
//         builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//           if (snapshot.hasData) {
//             List<Post> foods = snapshot.data;

//             return ListView.builder(
//               itemCount: 3,
//               itemBuilder: (ctx, idx) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.transparent,
//                       border: Border.all(width: 1, color: Colors.white)),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Text(foods[idx].id)),
//                     title: Text(
//                       foods[idx].name,
//                       style: Theme.of(context).textTheme.bodyText1,
//                     ),
//                     subtitle: Text(
//                       foods[idx].duration +
//                           ' menit' +
//                           ' | ' +
//                           foods[idx].calorie.toString() +
//                           ' kkal' +
//                           ' | ' +
//                           foods[idx].foodType,
//                       style: Theme.of(context).textTheme.bodyText2,
//                     ),
//                     onTap: () {
//                       showModalBottomSheet(
//                           isScrollControlled: true,
//                           context: context,
//                           enableDrag: false,
//                           backgroundColor: Colors.transparent,
//                           builder: (_) {
//                             return GestureDetector(
//                               behavior: HitTestBehavior.opaque,
//                               onTap: () {},
//                               child: FoodDetailScreen(
//                                 tombol: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                         builder: (context) => FoodRecipeScreen(
//                                               recipe:
//                                                   foods[idx].foodIngridientInfo,
//                                             )),
//                                   );
//                                 },
//                                 detail: foods[idx].name,
//                                 calorie: foods[idx].calorie.toString(),
//                                 protein: foods[idx].protein.toString(),
//                                 fat: foods[idx].fat.toString(),
//                               ),
//                             );
//                           });
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//           return Container(
//             alignment: Alignment.topCenter,
//             //     child: CircularProgressIndicator(
//             //   backgroundColor: Colors.green,
//             // )
//             child: ColorLoader5(),
//           );
//         },
//       ),
//     );
//   }
// }

// //
// //food getter
// class FoodsGetter extends StatefulWidget {
//   @override
//   _FoodsGetterState createState() => _FoodsGetterState();
// }

// class _FoodsGetterState extends State<FoodsGetter> {
//   @override
//   Widget build(BuildContext context) {
//     final double width = (MediaQuery.of(context).size.width);
//     return Center(
//       child: FutureBuilder(
//         future: Post.getFoods(),
//         builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//           if (snapshot.hasData) {
//             List<Post> foods = snapshot.data;

//             return ListView.builder(
//               // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               //   crossAxisCount: 1,
//               //   childAspectRatio: 1,
//               // ),
//               scrollDirection: Axis.horizontal,
//               itemCount: 1,
//               itemBuilder: (ctx, idx) {
//                 return Container(
//                   width: width * 1,
//                   margin: EdgeInsets.only(left: 6),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: width * 0.3,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(60),
//                             color: Colors.transparent,
//                             border: Border.all(width: 1, color: Colors.white)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text((foods[idx].calorie.toString())
//                                 // +' / ' +
//                                 // (foods[0].calorie +
//                                 //         foods[1].calorie +
//                                 //         foods[2].calorie)
//                                 //     .toString(),
//                                 ),
//                             Text('kalori'),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: width * 0.02,
//                       ),
//                       Container(
//                         width: width * 0.3,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(60),
//                             color: Colors.transparent,
//                             border: Border.all(width: 1, color: Colors.white)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text((foods[idx].protein.toString())
//                                 // +
//                                 //     ' / ' +
//                                 //     (foods[0].protein +
//                                 //             foods[1].protein +
//                                 //             foods[2].protein)
//                                 //         .toString(),
//                                 ),
//                             Text('protein'),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: width * 0.02,
//                       ),
//                       Container(
//                         width: width * 0.3,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(60),
//                             color: Colors.transparent,
//                             border: Border.all(width: 1, color: Colors.white)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text((foods[idx].fat.toString())
//                                 // +
//                                 //     ' / ' +
//                                 //     (foods[0].fat + foods[1].fat + foods[2].fat)
//                                 //         .toString(),
//                                 ),
//                             Text('Lemak'),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: width * 0.02,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }

//           return Container(
//             alignment: Alignment.topCenter,
//             //     child: CircularProgressIndicator(
//             //   backgroundColor: Colors.green,
//             // )
//             child: ColorLoader5(),
//           );
//         },
//       ),
//     );
//   }
// }
