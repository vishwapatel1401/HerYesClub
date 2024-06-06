import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/top_bar_content.dart';

class MediumAboutUsDesktop extends StatefulWidget {
  const MediumAboutUsDesktop({Key? key}) : super(key: key);

  @override
  State<MediumAboutUsDesktop> createState() => _MediumAboutUsDesktopState();
}

class _MediumAboutUsDesktopState extends State<MediumAboutUsDesktop> {
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
    final height = MediaQuery.of(context).size.height;

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
                'About Us',
                style: TextStyle(
                  fontFamily: 'TitleFont',
                  fontSize: 40,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'At Her Yes Club, we are dedicated to providing exceptional care for your little ones, ensuring their safety, happiness, and development. With a team of highly trained and compassionate caregivers, we strive to create a nurturing environment where children can learn, play, and grow. Our commitment to excellence drives us to exceed expectations, offering personalized services tailored to meet the unique needs of each family. From newborns to toddlers, we prioritize your child\'s well-being, fostering a sense of security and trust.',
                          style: TextStyle(
                            fontFamily: 'BodyFont2',
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/hyc13.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/hyc14.jpg'),
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
                          '"Empowering Children, Enriching Futures - Together We Grow!"\n'
                          'Join us at Her Yes Club and discover a place where children are encouraged to dream big, explore their passions, and embrace the joy of learning. Together, we can empower children, enrich futures, and create a brighter tomorrow.',
                          style: TextStyle(
                            fontFamily: 'BodyFont2',
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.start,
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
