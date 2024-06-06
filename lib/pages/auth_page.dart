import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/mobile_view/mobile_login.dart';
import 'package:test_project/mobile_view/test_profile.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage>{

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.data != null && snapshot.hasData){
            return TestProfile();
          }
          //user is not logged in
          else{
            return MobileLogin();
          }
        },
        );
  }
}