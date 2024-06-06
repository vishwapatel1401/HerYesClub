import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_login.dart';
import 'package:test_project/desktop_view/desktop_profile.dart';

class DesktopAuth extends StatelessWidget {
  const DesktopAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData){
            return DesktopProfile();
          }
          //user is not logged in
          else{
            return DkLogin();
          }
        },
        ),
    );
  }
}