import 'package:datademo2/pages/home_page.dart';
import 'package:datademo2/pages/sign_up.dart';
import 'package:flutter/material.dart';

void main()async{

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        SignUp.id:(context)=>SignUp(),
      },
    );
  }
}
