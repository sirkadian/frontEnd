import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirkadian_project/bloc/cubit/auth_cubit.dart';
import 'package:sirkadian_project/models/auth_models/register_request.dart';
import 'package:sirkadian_project/proper_widgets/loader.dart';
import 'package:sirkadian_project/screens/auth_screen/initialSetup_screen.dart';
import 'package:sirkadian_project/screens/auth_screen/userActivation_screen.dart';

import '../../widgets/button.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/logo.dart';
import '../../widgets/textfield.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          print('loading register');
        } else if (state is AuthSignUpSucces) {
          Navigator.of(context).pushReplacementNamed(
              UserActivationScreen.routeName,
              arguments: state.dataRegister.id.toString());
          print(state.dataRegister.id);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('success'),
              content: Text(
                state.dataRegister.message,
              ),
            ),
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
                                icon: Icon(Icons.account_circle),
                                title: 'Nama Pengguna',
                                color: Color(0xFFFF8663),
                                controller: _usernameController,
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              TextFields(
                                icon: Icon(Icons.account_circle),
                                title: 'Email',
                                color: Color(0xFFFF8663),
                                controller: _emailController,
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              PassTextFields(
                                title: 'Password',
                                color: Color(0xFFFF8663),
                                controller: _passwordController,
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
                                color1: Color(0xFF7F1E00),
                                color2: Color(0xFFFF8663),
                                color3: Color(0xFFFF8663),
                                buttontext: 'DAFTAR',
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 10),
                                onpress: () {
                                  final _requestData = RegisterRequest(
                                      email: _emailController.text,
                                      username: _usernameController.text,
                                      password: _passwordController.text);
                                  context.read<AuthCubit>().signUpUser(
                                      registerRequest: _requestData);
                                },
                              ),
                              FlatButtons(
                                onpress: () {
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushNamed(LoginScreen.routeName);
                                },
                                title: 'Sudah Punya akun? Masuk',
                                color: Color(0xFFFF8663),
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
