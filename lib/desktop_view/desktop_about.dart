import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/top_bar_content.dart';

class AboutUsDesktop extends StatefulWidget {
  const AboutUsDesktop({Key? key}) : super(key: key);

  @override
  State<AboutUsDesktop> createState() => _AboutUsDesktopState();
}

class _AboutUsDesktopState extends State<AboutUsDesktop> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      _opacity = _scrollPosition < 400 ? _scrollPosition / 400 : 1;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.brown[50],
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100),
        child: TopBarContents(_opacity),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'About',
                style: TextStyle(
                  fontFamily: 'Title',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 400,
                      height: 700,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/carmen.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi! I’m Carmen, a full-time working mom of two and the founder of Her Yes Club!',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Here’s how it all started.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'After I had my first baby and was preparing to return to work, I thought it would be easy to find childcare.  At the time, licensed daycare centres were too expensive and had waitlists over three years long, so I chose the home daycare route.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Despite 82% of Canadian childcare providers being home-based - I was surprised there was no easy way to find them. I was told by a friend that the only way to find a home daycare was through Facebook groups.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'So, I did what most moms do - I started scrolling non-stop through multiple groups, looking for someone who met my needs. It was tough.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'As a working mom, I often feel lonely, frustrated and desperate when it comes to childcare. Sick days, P.A. Days, daycare provider vacations - they all add up to time I have to miss work or scramble to find family to babysit my girls.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'You too? We’re not alone. ',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'A study shows that over 60% of Canadian parents have difficulties finding care - a task usually managed by the mother. This limits their employment opportunities and leads to increased stress, burnout and financial insecurity.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Recognizing I’m not the only one experiencing this, I’ve decided to create a solution: Her Yes Club.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Her Yes Club is an online platform and community for modern mothers and home-based caregivers to instantly connect. Whether you need a last-minute babysitter or a daycare for summer break, we’re here for you!',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'I can’t wait to share updates with you throughout the coming months. To make sure you stay informed, please subscribe via the website at www.heryesclub.ca.',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Thank you for your support!',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '~Carmen',
                          style: TextStyle(
                            fontFamily: 'Heading',
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
