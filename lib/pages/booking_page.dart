import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_booking.dart';
import 'package:test_project/medium_view/medium_booking.dart';
import 'package:test_project/mobile_view/mobile_booking.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: MobileBooking(),
        mediumScreen: MediumBooking(),
        desktopScreen: DesktopBooking(),
      ),
    );
  }
}