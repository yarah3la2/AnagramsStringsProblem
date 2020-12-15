import 'package:flutter/material.dart';
import 'package:flutter_ui_task/ui/HomeListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
     '/': (context) => MyCartListScreen(),
      }
    );
  }
}

