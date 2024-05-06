import 'package:flutter/material.dart';
import './screens/homepage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: Color.fromARGB(255, 206, 229, 248),
        primaryColorDark: Colors.black,
        useMaterial3: true
      ),
      home:Homepage(),
    );
  }
}
