import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_about.dart';
import 'package:test_project/medium_view/medium_about.dart';
import 'package:test_project/mobile_view/mobile_about.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: AboutUsMobile(),
        mediumScreen: MediumAboutUsDesktop(),
        desktopScreen: AboutUsDesktop(),
      ),
    );
  }
}