import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirkadian_project/bloc/cubit/auth_cubit.dart';

import 'package:sirkadian_project/models/auth_models/login_request.dart';
import 'package:sirkadian_project/proper_widgets/loader.dart';

import './forgetpass_screen.dart';

import '../../screens/tabs_screen.dart';
import './register_screen.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield.dart';
import '../../widgets/logo.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          print(state.errorMessage);
          //ngapain kalo pass error, moga gaerror lah cape
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('error'),
                    content: Text(state.errorMessage.toString()),
                  ));
        } else if (state is AuthLoading) {
          print('loading login');
        } else if (state is AuthLogSucces) {
          // Navigator.of(context).pushReplacementNamed(TabsScreen.routeName,
          //     arguments: state.dataLogin.accessToken);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TabsScreen(
                      authToken: state.dataLogin.accessToken,
                    )),
          );
        }
      }, builder: (context, state) {
        return state is AuthLoading
            ? Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: ColorLoader5(),
                ),
              )
            : Scaffold(
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
                          height: height * 0.1,
                          width: height * 0.35,
                          child: GreenLogo(),
                        ),
                        Container(
                          height: height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFields(
                                controller: _usernameController,
                                icon: Icon(Icons.account_circle),
                                title: 'Nama Pengguna',
                                color: Color(0xFF28DF99),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              PassTextFields(
                                controller: _passwordController,
                                title: 'Password',
                                color: Color(0xFF28DF99),
                              ),
                              FlatButtons(
                                onpress: () {
                                  Navigator.of(context)
                                      .pushNamed(ForgetPassScreen.routeName);
                                },
                                title: 'Lupa Password',
                                color: Color(0xFF28DF99),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GradientButton(
                                color1: Color(0xFF004338),
                                color2: Color(0xFF28DE98),
                                color3: Color(0xFF28DE98),
                                buttontext: 'MASUK',
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 10),
                                onpress: () {
                                  final _requestData = LoginRequest(
                                      username: _usernameController.text,
                                      password: _passwordController.text);
                                  context
                                      .read<AuthCubit>()
                                      .signInUser(loginRequest: _requestData);
                                },
                              ),
                              FlatButtons(
                                onpress: () {
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushNamed(RegisterScreen.routeName);
                                },
                                title: 'Belum Punya akun? Daftar',
                                color: Color(0xFF28DF99),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
