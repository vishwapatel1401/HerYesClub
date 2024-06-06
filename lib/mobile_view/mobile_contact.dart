import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/mobile_drawer.dart';

class ContactUsMobile extends StatefulWidget {
  const ContactUsMobile({Key? key}) : super(key: key);

  @override
  State<ContactUsMobile> createState() => _ContactUsMobileState();
}

class _ContactUsMobileState extends State<ContactUsMobile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showFeedbackSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thanks for your feedback!'),
        duration: Duration(seconds: 3),
      ),
    );
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Contact Details:',
              style: TextStyle(
                fontFamily: 'Heading',
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'CARMEN DOUCETTE',
              style: TextStyle(
                fontFamily: 'Body',
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
            const Text(
              'hello@heryesclub.ca',
              style: TextStyle(
                fontFamily: 'Body',
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hyc12.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Send us a Message:',
              style: TextStyle(
                fontFamily: 'Heading',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Your Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Your Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _messageController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Your Message',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  _showFeedbackSnackbar();
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
                    "SEND",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                )),
            SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }
}
