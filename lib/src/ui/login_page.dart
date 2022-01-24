import 'package:firebase_example/src/bloc/authentication/autnentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is AuthenticationSuccess){
            Navigator.pushNamed(context, "/dashboardPage");
        }else if (state is AuthenticationFailure){
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is AutnenticationInitial) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email"
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password"
                        ),
                      ),
                      ElevatedButton(onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context).login(_emailController.text,_passwordController.text);
                      }, child: const Text("Submit")),

                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, '/signupPage');
                      }, child: Text('Register now'))
                    ],
                  );
                } else if (state is AuthenticationLoading) {
                  return CircularProgressIndicator();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
