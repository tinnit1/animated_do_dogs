import 'package:animate_do_app/src/page/navegation_page.dart';
import 'package:animate_do_app/src/page/page1_page.dart';
import 'package:animate_do_app/src/page/twitter_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate_do',
      home: Page1Page(),
    );
  }
}