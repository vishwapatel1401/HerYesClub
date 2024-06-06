import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart'; // Import Stripe package
import 'package:table_calendar/table_calendar.dart';
import 'package:test_project/mobile_view/test_profile.dart';
import 'package:test_project/pages/about_page.dart';
import 'package:test_project/pages/blog_page.dart';
import 'package:test_project/pages/contact_page.dart';
import 'package:test_project/pages/home_page.dart';

class MobileBooking extends StatefulWidget {
  @override
  State<MobileBooking> createState() => _MobileBookingState();
}

class _MobileBookingState extends State<MobileBooking> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedChildcareProvider = '';
  List<String> childcareProviders = [];
  bool _isRecurringBooking = false; // Toggle for recurring bookings

  @override
  void initState() {
    super.initState();
    fetchChildcareProviders();
  }

  Future<void> fetchChildcareProviders() async {
    // Fetch ChildcareProviders (type 2 users) from Firestore
    var querySnapshot =
        await FirebaseFirestore.instance.collection('providers').get();
    setState(() {
      childcareProviders = querySnapshot.docs
          .map((doc) => doc.get('user name') as String)
          .toList();
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void bookAppointment() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      await FirebaseFirestore.instance.collection('bookings').add({
        'userId': uid,
        'childcareProvider': selectedChildcareProvider,
        'date': _selectedDay,
        'time': selectedTime.format(context),
      });

      // Charge payment using Stripe
      await _processPayment();

      // Send confirmation emails to both users
      _sendConfirmationEmails();

      // Show a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Appointment Booked!',
              style: TextStyle(color: Colors.brown)),
        ),
      );
    }
  }

  Future<void> _processPayment() async {
    try {
      // Initialize Stripe
      StripePayment.setOptions(
        StripeOptions(
          publishableKey:
              'your_publishable_key_here', //TODO: edit 'your_publishable_key_here'
          androidPayMode: 'test', // Use 'live' for production
        ),
      );

      // Create a payment method (e.g., card)
      PaymentMethod paymentMethod =
          await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      );

      // Charge the payment
      // Implement your server-side logic to create a payment intent and confirm it
      // ...
    } catch (error) {
      // Handle payment error
      // ...
    }
  }

  void _sendConfirmationEmails() {
    // Implement email sending logic
    // ...
  }

  void _toggleRecurringBooking(bool value) {
    setState(() {
      _isRecurringBooking = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[50],
          title: const Text(
            "MAKE BOOKINGS HERE",
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.brown[50],
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                  child: Image.asset('assets/images/Hyclogo.JPG'),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  title: Text('HOME'),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );
                  },
                  title: Text('ABOUT'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_emergency),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                  },
                  title: Text('CONTACT'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_emergency),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestProfile()),
                    );
                  },
                  title: Text('PROFILE PAGE'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_emergency),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BlogPage()),
                    );
                  },
                  title: Text('BLOGS'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_emergency),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MobileBooking()),
                    );
                  },
                  title: Text('BOOKING'),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  title: const Text('LOGOUT HERE'),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                ),
                SizedBox(height: 16),
                DropdownButton<String>(
                  value: selectedChildcareProvider,
                  onChanged: (newValue) {
                    setState(() {
                      selectedChildcareProvider = newValue!;
                    });
                  },
                  items: childcareProviders.map((childcareProvider) {
                    return DropdownMenuItem<String>(
                      value: childcareProvider,
                      child: Text(childcareProvider),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                          child: Text(
                        "SELECT TIME",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    )),
                // Toggle for recurring bookings
                SwitchListTile(
                  title: Text(
                    'Recurring Booking',
                    style: TextStyle(color: Colors.brown),
                  ),
                  value: _isRecurringBooking,
                  onChanged: _toggleRecurringBooking,
                ),
                SizedBox(height: 16),
                GestureDetector(
                    onTap: () {
                      bookAppointment();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                          child: Text(
                        "BOOK NOW",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    )),
              ],
            ),
          ),
        ));
  }
}
