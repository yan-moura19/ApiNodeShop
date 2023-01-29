import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nodeshop_front/pages/login_page.dart';
import 'package:nodeshop_front/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: routes,
      
      
      title: 'NodeShop',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}




