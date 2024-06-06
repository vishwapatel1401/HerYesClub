import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 11, 24, 3),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // For mobile layout
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildContactInfo(),
                SizedBox(height: 20),
                _buildSocialIcons(),
              ],
            );
          } else {
            // For medium layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildContactInfo(),
                _buildSocialIcons(),
              ],
            );
          }
        },
      ),
    );
  }

  // Function to build social icons
  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.end, // Align icons to the end (top right)
      children: [
        _buildIconWithLink(
          assetName: 'assets/images/insta.png',
          url: 'https://www.instagram.com/heryesclub?igshid=1lp4oawv66ld1',
        ),
        SizedBox(width: 10),
        _buildIconWithLink(
          assetName: 'assets/images/fb.png',
          url: 'https://www.facebook.com/heryesclub',
        ),
        SizedBox(width: 10),
        _buildIconWithLink(
          assetName: 'assets/images/email.png',
          url: 'mailto:hello@heryesclub.ca',
        ),
      ],
    );
  }

  // Function to build contact information
  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'her yes club ',
          style: TextStyle(
            fontSize: 50,
            fontFamily: 'Title',
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Her Yes Club is a safe place for all women and marginalized genders and welcomes anyone',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Subtitle',
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'identifies as she/her, they/them, or who isn’t sure.',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Subtitle',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // Function to build icon with link
  Widget _buildIconWithLink({
    required String assetName,
    required String url,
  }) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Image.asset(
        assetName,
        height: 50,
        width: 50,
      ),
    );
  }

  // Function to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
