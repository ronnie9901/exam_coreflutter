import 'package:exam_coreflutter/screens/details.dart';
import 'package:exam_coreflutter/screens/homepage.dart';
import 'package:exam_coreflutter/screens/save.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        '/':(context) => homapage(),
        '/save':(context) => savepage(),
        '/details':(context) => details(),

      },
    );
  }
}
