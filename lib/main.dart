import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/common/theme/dark_theme.dart';
import 'package:myapp/feature/auth/pages/login_page.dart';
import "package:myapp/feature/welcome/pages/welcome_page.dart";

import 'common/theme/light_theme.dart';
import 'feature/auth/pages/verification_page.dart';
void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "login":(context) =>   const LoginPage(),
        // "verify":(context) =>   const VerificationPage(),
        "verify":(context) =>   VerificationPage(phoneNumber:ModalRoute.of(context)?.settings!.arguments),

        // "/":(context) =>  MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由

      } ,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh','CH'),
      ],
      title: 'WhatsApp Me',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      // home: const VerificationPage(),
      home: const WelcomePage(),
    );
  }
}


