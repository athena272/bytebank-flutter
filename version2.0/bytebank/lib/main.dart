import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        appBarTheme: AppBarTheme(color: Colors.green[900]),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green[900]),
      ),
      home: const Dashboard(),
    );
  }
}


