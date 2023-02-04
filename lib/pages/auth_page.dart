import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/home_page.dart';
import 'package:flutterapp1/pages/login_or_register_page.dart';
import 'package:flutterapp1/pages/login_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User is Logged In
          if (snapshot.hasData) {
            return HomePage();
          }

          //User is not logged in
          else {
            return LoginOrRegisterPage();
          }

        },
      ),
    );
  }
}