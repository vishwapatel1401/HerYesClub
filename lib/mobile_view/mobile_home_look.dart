import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/mobile_drawer.dart';
import 'package:test_project/mobile_view/mobile_login.dart';
import 'package:test_project/mobile_view/mobile_register.dart';
import 'package:test_project/mobile_view/mobile_register_daycare.dart';

class MobileLook extends StatefulWidget {
  const MobileLook({super.key});

  @override
  State<MobileLook> createState() => _MobileLookState();
}

class _MobileLookState extends State<MobileLook> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    List<String> imagePaths = [
      'assets/images/hyc1.jpg',
      'assets/images/hyc7.jpg',
      'assets/images/hyc10.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        title: Text("HER YES CLUB"),
        centerTitle: true,
      ),
      drawer: MobileDrawer(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  height: height * 0.6,
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
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 134, 85, 74),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Her Yes Club is an on-demand support system and inclusive online community to help you instantly find the reliable childcare you need.',
                      style: TextStyle(
                        fontFamily: 'Body',
                        fontSize: 15,
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
                                  builder: (context) => MobileRegister()),
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
                              fontSize: 15,
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
                                  builder: (context) =>
                                      MobileRegisterDayCare()),
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
                              fontSize: 15,
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Our Services',
                        style: TextStyle(
                          fontFamily: 'Head',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/nannies.jpeg',
                            height: 150,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Nannies & Babysitters',
                            style: TextStyle(
                              fontFamily: 'Subtitle',
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/house.jpg',
                            height: 150,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Home Daycares',
                            style: TextStyle(
                              fontFamily: 'Subtitle',
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/transport.jpg',
                            height: 150,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Child Transportation',
                            style: TextStyle(
                              fontFamily: 'Subtitle',
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/meal.jpg',
                            height: 150,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Before & After School Care',
                            style: TextStyle(
                              fontFamily: 'Subtitle',
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
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
                        height: 460,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'STEP 1: CREATE YOUR PROFILE',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'You can also connect with those you ​know, other local moms, and identify ​mutual friends.',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'STEP 2: FIND YOUR SUPPORT SYSTEM',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Describe the type of care you need and ​post a call for support.',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'STEP 3: PUT YOUR FEET UP',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'We instantly match you with available ​childcare providers that fit your unique ​needs and show you the friends you ​have in common.',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 155, 104, 93),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Personal and mutual connections ​go a long way. But Her Yes Club ​goes the extra mile. All users ​offering childcare undergo the ​following safety screenings so you ​can have peace of mind.',
                            style: TextStyle(
                              fontFamily: 'Subtitle',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '1.ID Verification*',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '2.Enhanced Criminal Record Check*',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '3.CPR + First Aid Verification',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '4.Softcheck: 110,000+ databases*',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '*Her Yes Club is a proud partner of ​Certn, the global leader in easy and ​extensive background checks.',
                            style: TextStyle(
                              fontFamily: 'Subtitle',
                              fontSize: 15,
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
                        height: 560,
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
                              fontSize: 40,
                              color: const Color.fromARGB(255, 155, 104, 93),
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
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Your support system is here and ready to say yes when you need us.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Body',
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MobileLogin()),
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 155, 104, 93),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SIGN UP TODAY',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 12,
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
              SizedBox(height: 20),
              Footer(),
            ],
          );
        },
      ),
    );
  }
}
