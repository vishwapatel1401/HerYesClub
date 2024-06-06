import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_home_look.dart';
import 'package:test_project/medium_view/medium_home_look.dart';
import 'package:test_project/mobile_view/mobile_home_look.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
        mobileScreen: const MobileLook(),
        mediumScreen: const MediumLook(),
        desktopScreen: const DesktopLook(),
      ),
    );
  }
}

