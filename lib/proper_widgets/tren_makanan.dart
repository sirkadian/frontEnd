import 'package:flutter/material.dart';
import 'package:sirkadian_project/models/food_models/food_model.dart';

class TrenMakanan extends StatefulWidget {
  final List<AllFoodResponse> allFoods;

  const TrenMakanan({Key key, this.allFoods}) : super(key: key);
  @override
  _TrenMakananState createState() => _TrenMakananState();
}

class _TrenMakananState extends State<TrenMakanan> {
  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: BouncingScrollPhysics(),
      itemBuilder: (ctx, idx) => InkWell(
        child: Container(
          width: width * 0.45,
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.only(right: 8),
            child: Row(
              children: [
                // Expanded(
                //   flex: 3,
                //   child: Container(
                //     child: FadeInImage(
                //       placeholder: AssetImage('assets/images/uploadFoto.png'),
                //       image: NetworkImage(
                //           '$uploadPhoto${widget.allFoods[idx].images}'),
                //       fit: BoxFit.cover,
                //       width: 50,
                //       height: 50,
                //     ),
                //   ),
                // ),
                Expanded(
                  flex: 7,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.allFoods[idx].name,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          widget.allFoods[idx].duration.toString(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          widget.allFoods[idx].calorie.toString(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VariabelTren {
  final int id;
  final String nama;
  final String waktu;
  final String kalori;
  final double rate;
  VariabelTren({
    this.id,
    this.nama,
    this.waktu,
    this.kalori,
    this.rate,
  });
}
