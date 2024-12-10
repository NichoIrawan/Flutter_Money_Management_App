// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_money_management/Page/home_page.dart';
import 'package:flutter_money_management/Page/wallet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(239, 240, 240, 1.0), 
          primary: Color.fromRGBO(242, 243, 243, 1.0), 
          secondary: Color.fromRGBO(146, 208, 211, 1.0), 
          tertiary: Color.fromRGBO(235, 227, 206, 1.0),
        ),
        useMaterial3: true,
      ),
      home: MyWallet(),
    );
  }
}
