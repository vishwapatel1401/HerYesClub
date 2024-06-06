import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/textbox.dart';
import 'package:test_project/mobile_view/mobile_booking.dart';
import 'package:test_project/pages/about_page.dart';
import 'package:test_project/pages/blog_page.dart';
import 'package:test_project/pages/contact_page.dart';
import 'package:test_project/pages/home_page.dart';

class TestProfile extends StatefulWidget {
  const TestProfile({super.key});

  @override
  State<TestProfile> createState() => _TestProfileState();
}

class _TestProfileState extends State<TestProfile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<void> editField(String field) async{

  }

var collection = FirebaseFirestore.instance.collection("users");
  late List<Map<String, dynamic>> userDetails;
  bool isLoaded = false;

  showUserData() async{
    List<Map<String, dynamic>> tempList =[];
    var data = await collection.get();

    data.docs.forEach((element) {
      tempList.add(element.data());
    });
    setState(() {
      userDetails = tempList;
      isLoaded = true;
    });
  }

  @override
  void initState(){
    super.initState();

    showUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Colors.brown[50],
      ),
      drawer: Drawer(
      child: Container(
        color: Colors.brown[50],
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/Hyclogo.JPG'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              title: Text('HOME'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
              title: Text('ABOUT'),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
              title: Text('CONTACT'),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestProfile()),
                );
              },
              title: Text('PROFILE PAGE'),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogPage()),
                );
              },
              title: Text('BLOGS'),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MobileBooking()),
                );
              },
              title: Text('BOOKING'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              title: const Text('LOGOUT HERE'),
            ),
            
          ],
        ),
      ),
    ),
      body: isLoaded ? ListView(
        children: [
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
            ),
          ),

          const SizedBox(height: 20,),
          const Padding(padding: EdgeInsets.only(left: 25.0),
          child: Text('User Details', style: TextStyle(color: Colors.brown),),),

          const SizedBox(height: 20,),
            MyTextBox(
              sectionName: 'User Name',
              text: 'Mitch James',
              onPressed: () => editField('username'),
              ),

          const SizedBox(height: 20,),
            MyTextBox(
              sectionName: 'First name',
              text: 'Mitch',
              onPressed: () => editField('first name'),
              ),

          const SizedBox(height: 20,),
            MyTextBox(
              sectionName: 'last name',
              text: 'James',
              onPressed: () => editField('last name'),
              ),

          const SizedBox(height: 20,),
            MyTextBox(
              sectionName: 'email',
              text: 'mjames@dcmail.ca',
              onPressed: () => editField('email'),
              ),

        
        ],
        ) : Material(child: Center(child: CircularProgressIndicator(),),),
    );
  }
}