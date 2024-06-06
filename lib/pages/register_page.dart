import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_register.dart';
import 'package:test_project/medium_view/medium_register.dart';
import 'package:test_project/mobile_view/mobile_register.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: MobileRegister(),
        mediumScreen: MediumRegister(),
        desktopScreen: DkRegister(),
      ),
    );
  }
}