import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_project/components/top_bar_content.dart';

class DesktopBooking extends StatefulWidget {
  const DesktopBooking({super.key});

  @override
  State<DesktopBooking> createState() => _DesktopBookingState();
}

class _DesktopBookingState extends State<DesktopBooking> {
DateTime _selectedDay = DateTime.now();
DateTime _focusedDay = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();
String selectedChildcareProvider = '';
List<String> childcareProviders = [];
bool _isRecurringBooking = false;
final ScrollController _scrollController = ScrollController();
double _scrollposition = 0;
double _opacity = 0;

_scrollListener() {
  setState(() {
    _scrollposition = _scrollController.position.pixels;
  });
}

@override
void initState(){
  _scrollController.addListener(_scrollListener);
  super.initState();
}

  Future<void> fetchChildcareProviders() async {
    // Fetch ChildcareProviders (type 2 users) from Firestore
    var querySnapshot = await FirebaseFirestore.instance
        .collection('providers')
        .get();
    setState(() {
      childcareProviders = querySnapshot.docs
          .map((doc) => doc.get('user name') as String)
          .toList();
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime
    );
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
          content: Text('Appointment Booked!', style: TextStyle(color: Colors.brown)),
        ),
      );
    }
  }

  Future<void> _processPayment() async {
    try {
      // Initialize Stripe
      StripePayment.setOptions(
        StripeOptions(
          publishableKey: 'your_publishable_key_here', //TODO: edit 'your_publishable_key_here'
          androidPayMode: 'test', // Use 'live' for production
        ),
      );

      // Create a payment method (e.g., card)
      PaymentMethod paymentMethod = await StripePayment.paymentRequestWithCardForm(
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
      var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollposition < screenSize.height * 0.40
    ? _scrollposition / (screenSize.height * 0.40)
    : 1;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown[50],
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: TopBarContents(_opacity),),
      resizeToAvoidBottomInset: true,

    body: SingleChildScrollView(
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hyc4.JPG'))
                ),
              )
              ),
              Expanded(
                child: Container(
                height: height,
                color: Colors.brown[50],
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                onTap: (){
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
                child: Text("SELECT TIME",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),)),
              )
            ),
            // Toggle for recurring bookings
            SwitchListTile(
              title: Text('Recurring Booking', style: TextStyle(color: Colors.brown),),
              value: _isRecurringBooking,
              onChanged: _toggleRecurringBooking,
            ),
            SizedBox(height: 16),
            GestureDetector(
                onTap: (){
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
                child: Text("BOOK NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),)),
              )
            ),
              ]
              ),
                  ),
                )
                )
              )
          ],
        ),
      ),
    ),
      );
  }
}