import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirkadian_project/bloc/cubit/auth_cubit.dart';
import 'package:sirkadian_project/models/auth_models/userActivation_request.dart';
import 'package:sirkadian_project/models/url_model.dart';
import 'package:sirkadian_project/screens/tabs_screen.dart';

import '../../widgets/gradient_button.dart';

import '../../widgets/textfield.dart';

class UserActivationScreen extends StatefulWidget {
  static const routeName = '/userActivation-screen';
  const UserActivationScreen({Key key}) : super(key: key);

  @override
  _UserActivationScreenState createState() => _UserActivationScreenState();
}

class _UserActivationScreenState extends State<UserActivationScreen> {
  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('apakah anda ingin kembali?'),
              content: Text(
                  'anda akan tidak bisa kembali setelah anda meninggalkan halaman ini'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('no'))
              ],
            ));

    return shouldPop ?? false;
  }

  final _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String idUser = ModalRoute.of(context).settings.arguments;
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('error'),
                    content: Text(state.errorMessage.toString()),
                  ));
        } else if (state is AuthLoading) {
          print('loading activation');
        } else if (state is AuthActivationSucces) {
          Navigator.of(context).pushReplacementNamed(TabsScreen.routeName,
              arguments: state.dataActivation);
          print(state.dataActivation);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('success'),
              content: Text(
                state.dataActivation.message,
              ),
            ),
          );
        }
      }, builder: (context, state) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.096,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        height: height * 0.2,
                        width: height * 0.55,
                        child: Text(
                          'Konfirmasi Kode Verfikasi',
                          style: Theme.of(context).textTheme.headline1,
                        )),
                    Container(
                      height: height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'Cek email Anda dan ketik kode verifikasi untuk melanjutkan proses registrasi',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Color(0xFF28DF99), fontSize: 16),
                              )),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          TextFields(
                            icon: Icon(Icons.lock),
                            title: 'Kode Verifikasi',
                            color: Color(0xFF28DF99),
                            controller: _codeController,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientButton(
                            color1: Color(0xFF004338),
                            color2: Color(0xFF28DE98),
                            color3: Color(0xFF28DE98),
                            buttontext: 'KIRIM KODE',
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 11),
                            onpress: () {
                              context
                                  .read<AuthCubit>()
                                  .activationUser(idUser, _codeController.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
