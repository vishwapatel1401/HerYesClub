import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/mobile_drawer.dart';
import 'package:test_project/mobile_view/mobile_register_daycare.dart';

class MediumLook extends StatefulWidget {
  const MediumLook({super.key});

  @override
  State<MediumLook> createState() => _MediumLookState();
}

class _MediumLookState extends State<MediumLook> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    List<String> imagePaths = [
      'assets/images/hyc1.jpg',
      'assets/images/hyc7.jpg',
      'assets/images/hyc10.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        title: Text("HER YES CLUB"),
        centerTitle: true,
      ),
      drawer: MobileDrawer(
      ),
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
              SizedBox(height: 20),
              Center(
                child: Text(
                  '~ A Community of local people who can help care for your kids',
                  style: TextStyle(
                    fontFamily: 'TitleFont',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MobileRegister()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 240, 164, 168),
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text(
                    'Search DayCare Provider',
                    style: TextStyle(
                      fontFamily: 'BodyFont',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
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
                          fontFamily: 'TitleFont',
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
                              fontFamily: 'BodyFont2',
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
                            'HouseKeeping',
                            style: TextStyle(
                              fontFamily: 'BodyFont2',
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
                              fontFamily: 'BodyFont2',
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
                            'Meal Preparation',
                            style: TextStyle(
                              fontFamily: 'BodyFont2',
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
              SizedBox(height: 20),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Looking for a job?',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 136, 101, 90),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobileRegisterDayCare()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Find Your perfect provider in few steps:',
                  style: TextStyle(
                    fontFamily: 'TitleFont',
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
                    Text(
                      '1. Find your ideal caregiver effortlessly.',
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '2. Establish communication with ease.',
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '3. Secure your preferred service seamlessly.',
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '4. Enjoy peace of mind throughout.',
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '5. Watch your little ones flourish.',
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verified Babysitter',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'CPR',
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text(
                            'First Aid Training',
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Background Check',
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text(
                            'Police Verification',
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Immunization Record',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Discover the best caregivers near you.',
                  style: TextStyle(
                    fontFamily: 'BodyFont4',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Available in:',
                      style: TextStyle(
                        fontFamily: 'BodyFont4',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Oshawa',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Ajax',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Pickering',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Scarborough',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Toronto',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Brampton',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Mississuaga',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Oakville',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Etobicoke',
                          style: TextStyle(
                            fontFamily: 'TitleFont',
                            fontSize: 25,
                            color: Colors.black87,
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
          );
        },
      ),
    );
  }
}
