import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    ProviderScope(child: MyApp())
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF394867)),
        primaryColor: Color(0xFF212A3E),
        // backgroundColor: Color(0xFF9BA4B5),
      ),
      home: Home(),
    );
  }
}
