
import 'package:firebase_example/src/bloc/authentication/autnentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegistartionPage extends StatelessWidget {
  RegistartionPage({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit,AuthenticationState>(
      listener: (BuildContext context, state) {
        if(state is AuthenticationSuccess){
          Navigator.pushNamed(context, '/dashboardPage');
        }else if(state is AuthenticationFailure){
          Fluttertoast.showToast(msg: "Authentication Failed");
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
                        BlocProvider.of<AuthenticationCubit>(context).signup(_emailController.text, _passwordController.text);
                      }, child: const Text("Register"))
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
        )
      ),
    );
  }
}
