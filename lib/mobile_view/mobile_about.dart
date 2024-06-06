import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/mobile_drawer.dart';

class AboutUsMobile extends StatefulWidget {
  const AboutUsMobile({super.key});

  @override
  State<AboutUsMobile> createState() => _AboutUsMobileState();
}

class _AboutUsMobileState extends State<AboutUsMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'About Us',
            style: TextStyle(
              fontFamily: 'Title',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          centerTitle: true,
        ),
        drawer: MobileDrawer(),
        backgroundColor: Colors.brown[50],
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi! I’m Carmen, a full-time working mom of two and the founder of Her Yes Club! \n'
                      'Here’s how it all started.\n'
                      'After I had my first baby and was preparing to return to work, I thought it would be easy to find childcare.  At the time, licensed daycare centres were too expensive and had waitlists over three years long, so I chose the home daycare route.\n'
                      'Despite 82% of Canadian childcare providers being home-based - I was surprised there was no easy way to find them. I was told by a friend that the only way to find a home daycare was through Facebook groups.\n'
                      'So, I did what most moms do - I started scrolling non-stop through multiple groups, looking for someone who met my needs. It was tough.',
                      style: TextStyle(
                        fontFamily: 'Body',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/carmen.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'As a working mom, I often feel lonely, frustrated and desperate when it comes to childcare. Sick days, P.A. Days, daycare provider vacations - they all add up to time I have to miss work or scramble to find family to babysit my girls.\n'
                      'You too? We’re not alone. \n'
                      'A study shows that over 60% of Canadian parents have difficulties finding care - a task usually managed by the mother. This limits their employment opportunities and leads to increased stress, burnout and financial insecurity.\n'
                      'Recognizing I’m not the only one experiencing this, I’ve decided to create a solution: Her Yes Club.\n'
                      'Her Yes Club is an online platform and community for modern mothers and home-based caregivers to instantly connect. Whether you need a last-minute babysitter or a daycare for summer break, we’re here for you!\n'
                      'I can’t wait to share updates with you throughout the coming months. To make sure you stay informed, please subscribe via the website at www.heryesclub.ca.\n'
                      'Thank you for your support!',
                      style: TextStyle(
                        fontFamily: 'Body',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '~Carmen',
                      style: TextStyle(
                        fontFamily: 'Heading',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
