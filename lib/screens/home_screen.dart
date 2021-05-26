import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirkadian_project/bloc/cubit/auth_cubit.dart';

import 'package:sirkadian_project/models/auth_models/initS_request.dart';

import 'package:sirkadian_project/models/food_models/food_model.dart';

import '../proper_widgets/information_card.dart';

import '../models/food_models/food_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  List<AllFoodResponse> allFoods = [];
  final String authToken;
  bool rendered;
  HomeScreen({
    Key key,
    this.authToken,
    this.rendered = false,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool loading = false;

  // Future<Null> _fetchData() async {
  //   if (widget.rendered == false) {
  //     setState(() {
  //       loading = true;
  //     });
  //     final responseAll = await http.get(apiMakanUrl);

  //     if (responseAll.statusCode == 200) {
  //       final data = jsonDecode(responseAll.body);
  //       setState(() {
  //         for (Map idx in data) {
  //           widget.allFoods.add(Post.fromJson(idx));
  //         }
  //         widget.rendered = true;
  //         loading = false;
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   _fetchData();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height);
    final double width = (MediaQuery.of(context).size.width);

    // untuk size bisa pake mediaquery.size buat ukuran icon dan font

    return
        // loading
        //     ? Container(
        //         color: Colors.white,
        //         alignment: Alignment.topCenter,
        //         child: ColorLoader5(),
        //       )
        //     :
        BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          //ngapain kalo pass error
          print(state.errorMessage);
        } else if (state is AuthLoading) {
          print('loading');
        } else if (state is InitialsetupLogSucces) {
          print(state.dataInitS.message);
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFF5FFF9),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
              ),
              Container(
                width: width * 1,
                height: height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg2.png'),
                        fit: BoxFit.cover)),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.02),
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo,',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'AbiyyudaNaufal.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.05),
                              ),
                              SizedBox(height: height * 0.02),
                              Container(
                                child: InformationCard(),
                              ),
                              SizedBox(height: height * 0.02),
                              // Container(
                              //   child: Text(
                              //     'Ada yang bisa Sirkadian bantu?',
                              //     style: TextStyle(
                              //         color: Colors.white, fontSize: height * 0.04),
                              //   ),
                              // ),
                              // SizedBox(height: height * 0.02),
                              // Container(child: HomeMenu()),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, bottom: 5),
                          child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   child: Text(
                                //     'Tren Makanan Hari ini',
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize: height * 0.04),
                                //   ),
                                // ),
                                // SizedBox(height: height * 0.02),
                                // Container(
                                //     height: height * 0.2,
                                //     child: TrenMakanan(
                                //       allFoods: widget.allFoods,
                                //     )),
                                SizedBox(height: height * 0.05),
                                // TextFields(
                                //   icon: Icon(Icons.account_circle),
                                //   title: 'Nama Pengguna',
                                //   color: Color(0xFF28DF99),
                                // ),
                                ElevatedButton(
                                  onPressed: () {
                                    final _requestData = InitialSetupRequest(
                                      id: 12,
                                      dob: '02-09-2001',
                                      gender: 'male',
                                      lang: 'idn',
                                      height: 165,
                                      weight: 65,
                                      activityLevel: 'sedentary',
                                      sportDifficulty: 'easy',
                                      vegan: false,
                                      maintainWeight: 1,
                                      allergy: [1, 2],
                                      disease: [1, 2],
                                      addiction: [1],
                                    );
                                    context.read<AuthCubit>().getUserInitS(
                                        initialSetupRequest: _requestData,
                                        authToken: widget.authToken);
                                  },
                                  child: Text('getInitState'),
                                )
                              ]),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
