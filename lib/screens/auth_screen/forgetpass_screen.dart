import 'package:flutter/material.dart';

import '../../widgets/gradient_button.dart';

import '../../widgets/textfield.dart';

class ForgetPassScreen extends StatelessWidget {
  static const routeName = '/forgetpass-screen';
  const ForgetPassScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      backgroundColor: Colors.black,
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
                  height: height * 0.1,
                  width: height * 0.55,
                  child: Text(
                    'Lupa Password?',
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
                          'Masukkan email untuk pengiriman kode verifikasi',
                          style: TextStyle(color: Color(0xFF28DF99)),
                        )),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    TextFields(
                      icon: Icon(Icons.account_circle),
                      title: 'Email',
                      color: Color(0xFF28DF99),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 11),
                      onpress: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
