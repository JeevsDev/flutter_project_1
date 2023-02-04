import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //Sign User Out Method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))]),
        body: 
        Center(
          
          child: Text(
              "LOGGED IN AS: "+ user.email!
          ),
        
    )
    
    );
      
    
  }
}