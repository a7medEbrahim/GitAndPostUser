import 'package:flutter/material.dart';
import 'package:task1/network/Dio_helper.dart';
import 'package:task1/view/screens/AddUser.dart';
import 'package:task1/view/screens/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cupits/BlocObserver.dart';

void main() async {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AddUser.routeName: (context) => AddUser()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
