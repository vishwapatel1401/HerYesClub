import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_register_daycare.dart';
import 'package:test_project/medium_view/medium_register_daycare.dart';
import 'package:test_project/mobile_view/mobile_register_daycare.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class DaycareRegister extends StatefulWidget {
  const DaycareRegister({Key? key}) : super(key: key);

  @override
  State<DaycareRegister> createState() => DaycareRegisterState();
}

class DaycareRegisterState extends State<DaycareRegister> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: MobileRegisterDayCare(),
        mediumScreen: MedRegisterDayCare(),
        desktopScreen: DkRegisterDaycare(),
      ),
    );
  }
}