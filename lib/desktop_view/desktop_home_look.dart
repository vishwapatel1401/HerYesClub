import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/top_bar_content.dart';
import 'package:test_project/desktop_view/desktop_login.dart';
import 'package:test_project/desktop_view/desktop_register.dart';
import 'package:test_project/desktop_view/desktop_register_daycare.dart';

class DesktopLook extends StatefulWidget {
  const DesktopLook({Key? key}) : super(key: key);

  @override
  State<DesktopLook> createState() => _DesktopLookState();
}

class _DesktopLookState extends State<DesktopLook> {
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
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    List<String> imagePaths = [
      'assets/images/hyc1.jpg',
      'assets/images/hyc7.jpg',
      'assets/images/hyc10.jpeg',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100),
        child: TopBarContents(_opacity), // Pass opacity to the top bar contents
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                height: height * 0.9,
              ),
              items: imagePaths.map((imagePath) {
                return Container(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 0),
            Container(
              color: Color.fromARGB(166, 230, 214, 200),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'YOUR SUPPORT SYSTEM IS HERE.',
                    style: TextStyle(
                      fontFamily: 'Heading',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 134, 85, 74),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Her Yes Club is an on-demand support system and inclusive online community to help you instantly find the reliable childcare you need.',
                    style: TextStyle(
                      fontFamily: 'Body',
                      fontSize: 20,
                      color: const Color.fromARGB(255, 134, 85, 74),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DkRegister()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 167, 108, 95),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.all(20),
                        ),
                        child: Text(
                          'I NEED CHILDCARE',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DkRegisterDaycare()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 100, 63, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.all(20),
                        ),
                        child: Text(
                          'I OFFER CHICLDCARE',
                          style: TextStyle(
                            fontFamily: 'Body',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Center(
                    child: Text(
                      'Our Services',
                      style: TextStyle(
                        fontFamily: 'Head',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/nannies.jpeg',
                                  height: 250,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Nannies & Babysitters',
                                  style: TextStyle(
                                    fontFamily: 'Subtitle',
                                    fontSize: 25,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/house.jpg',
                                  height: 250,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Home Daycares',
                                  style: TextStyle(
                                    fontFamily: 'Subtitle',
                                    fontSize: 25,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/transport.jpg',
                                  height: 250,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Child Transportation',
                                  style: TextStyle(
                                    fontFamily: 'Subtitle',
                                    fontSize: 25,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/meal.jpg',
                                  height: 250,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Before & After School Care',
                                  style: TextStyle(
                                    fontFamily: 'Subtitle',
                                    fontSize: 25,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromARGB(255, 241, 191, 233),
                          child: Image.asset(
                            'assets/images/hyc5.jpg',
                            fit: BoxFit.cover,
                            height: 640,
                            width: 200,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromARGB(255, 255, 245, 252),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HOW IT WORKS',
                                style: TextStyle(
                                  fontFamily: 'Heading',
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown[800],
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'STEP 1: CREATE YOUR PROFILE',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'You can also connect with those you ​know, other local moms, and identify ​mutual friends.',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'STEP 2: FIND YOUR SUPPORT SYSTEM',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Describe the type of care you need and ​post a call for support.',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'STEP 3: PUT YOUR FEET UP',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'We instantly match you with available ​childcare providers that fit your unique ​needs and show you the friends you ​have in common.',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromARGB(255, 227, 234, 247),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BUILT UPON TRUST AND SAFETY',
                                style: TextStyle(
                                  fontFamily: 'Heading',
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 155, 104, 93),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Personal and mutual connections ​go a long way. But Her Yes Club ​goes the extra mile. All users ​offering childcare undergo the ​following safety screenings so you ​can have peace of mind.',
                                style: TextStyle(
                                  fontFamily: 'Subtitle',
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '1.ID Verification*',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 25,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '2.Enhanced Criminal Record Check*',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 25,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '3.CPR + First Aid Verification',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 25,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '4.Softcheck: 110,000+ databases*',
                                style: TextStyle(
                                  fontFamily: 'Body',
                                  fontSize: 25,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '*Her Yes Club is a proud partner of ​Certn, the global leader in easy and ​extensive background checks.',
                                style: TextStyle(
                                  fontFamily: 'Subtitle',
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromARGB(255, 241, 191, 233),
                          child: Image.asset(
                            'assets/images/hyc3.jpg',
                            fit: BoxFit.cover,
                            height: 700,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'JOIN THE CLUB',
                                style: TextStyle(
                                  fontFamily: 'Subtitle',
                                  fontSize: 60,
                                  color:
                                      const Color.fromARGB(255, 155, 104, 93),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'You have a lot on your plate - endlessly searching for quality ​childcare shouldn`t be one of them.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Body',
                                        fontSize: 30,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Your support system is here and ready to say yes when you need us.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Body',
                                        fontSize: 30,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DkLogin()),
                                        );
                                      },
                                      child: Container(
                                        width: 200,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 155, 104, 93),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'SIGN UP TODAY',
                                            style: TextStyle(
                                              fontFamily: 'Body',
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Footer(),
          ],
        ),
      ),
    );
  }
}
