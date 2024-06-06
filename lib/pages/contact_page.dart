import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_contact.dart';
import 'package:test_project/medium_view/medium_contact.dart';
import 'package:test_project/mobile_view/mobile_contact.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: const ContactUsMobile(),
        mediumScreen: const ContactUsMedium(),
        desktopScreen: const ContactUsDesktop(),
      ),
    );
  }
}
