import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_login.dart';
import 'package:test_project/medium_view/medium_login.dart';
import 'package:test_project/mobile_view/mobile_login.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: MobileLogin(),
        mediumScreen: MediumLogin(),
        desktopScreen: DkLogin(),
      ),
    );
  }
}