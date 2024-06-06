import 'package:flutter/material.dart';
import 'package:test_project/components/footer.dart';
import 'package:test_project/components/top_bar_content.dart';

class ContactUsMedium extends StatefulWidget {
  const ContactUsMedium({Key? key}) : super(key: key);

  @override
  State<ContactUsMedium> createState() => _ContactUsMediumState();
}

class _ContactUsMediumState extends State<ContactUsMedium> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: TopBarContents(1.0),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Details:',
                        style: TextStyle(
                          fontFamily: 'BodyFont2',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'CARMEN DOUCETTE',
                        style: TextStyle(
                          fontFamily: 'BodyFont3',
                          fontSize: 25,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'CARMEN.DOUCETTE@OUTLOOK.COM',
                        style: TextStyle(
                          fontFamily: 'BodyFont3',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '905-435-6433',
                        style: TextStyle(
                          fontFamily: 'BodyFont3',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hyc12.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Send us a Message:',
              style: TextStyle(
                fontFamily: 'BodyFont2',
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
                borderSide:  BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)
                ),
                ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Your Email',
                border:  OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)
                ),),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _messageController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Your Message',
                border: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)
                ),
                ), ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: (){
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
                child: Text("SEND",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),)),
              )
            ),
            SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }
}
