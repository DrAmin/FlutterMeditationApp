import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practical_task/utils/Color.dart';

import 'DashboardView.dart';

void main(){
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    systemNavigationBarColor: Color(darkBlueColor),
//    statusBarColor: Color(darkBlueColor),
//  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardView(),
    );
  }
}

