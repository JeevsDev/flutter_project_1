



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/components/my_button.dart';
import 'package:flutterapp1/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {

    //Show Loading Circle
    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.black),
      ),
      );
    },
  );

    //Try Sign In
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      );
      //Pop The Loading Circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //Pop The Loading Circle
      Navigator.pop(context);

      //WRONG EMAIL
      if (e.code == 'user-not-found') {
        //SHOW ERROR TO USER
        wrongEmailMessage();
      }

      //WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        //SHOW ERROR TO USER
        wrongPasswordMessage();
      }
    }

    // //Pop The Loading Circle
    // Navigator.pop(context);
  }

  //WRONG EMAIL MESSAGE POP UP
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Center(
            child: Text(
              'Email is incorrect!',
              style: TextStyle(color: Colors.white),
              ),
          ),
        );
      },
    );
  }

  //WRONG PASSWORD MESSAGE POPUP
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Center(
            child: Text(
              'Password is incorrect!',
              style: TextStyle(color: Colors.white),
              ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),

          // Logo
          ImageIcon(AssetImage("lib/images/flutterlogo.png"),
          size: 100,
          ),

          const SizedBox(height: 30),

          //Welcome Back Screen
          Text(
            "Welcome back! Glad to see you, pal!",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
              ),
      ),

          const SizedBox(height: 30),

          //Username Textfield
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 10),

          //Password Textfield
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(height: 40),

          //Forgot Password

          //Sign in button
          MyButton(
            text: "Sign In",
            onTap: signUserIn,
          ),
          
          const SizedBox(height: 50),

        //or continue with

        //google sign in

        //not a member? Register.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not a member?",
              style: TextStyle(color: Colors.grey[700]),
              ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: widget.onTap,
              child: const Text(
                "Register now.",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
        ],)

            ],
          ),
        ),
      ),
      )
    );
  }
}
