import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/auth_page.dart';
import 'package:flutterapp1/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapp1/pages/spash_screen.dart';
import 'package:flutterapp1/splashscreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // ignore: prefer_const_literals_to_create_immutables
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        })
      ),
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
