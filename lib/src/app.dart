
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication/autnentication_cubit.dart';
import 'bloc/task/task_cubit.dart';
import 'ui/dashboard_page.dart';
import 'ui/login_page.dart';
import 'ui/registration_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthenticationCubit()),
        BlocProvider(create: (context)=>TaskCubit()),
      ],
      child: MaterialApp(
        title: "ZeroPI",
        theme: ThemeData(
            primarySwatch: Colors.green
        ),
        routes: {
          '/loginPage': (context) => LoginPage(),
          '/dashboardPage': (context) => DashboardPage(),
          '/signupPage' : (context) => RegistartionPage()
        },
        initialRoute: '/loginPage',
      ),
    );
  }
}