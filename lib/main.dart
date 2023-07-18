import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import "package:myapp/feature/welcome/pages/welcome_page.dart";
void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomePage(),
    );
  }
}


