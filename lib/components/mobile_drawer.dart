import 'package:flutter/material.dart';
import 'package:test_project/mobile_view/mobile_about.dart';
import 'package:test_project/mobile_view/mobile_contact.dart';
import 'package:test_project/mobile_view/mobile_register.dart';
import 'package:test_project/pages/auth_page.dart';
import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/register_daycare.dart';

class MobileDrawer extends StatefulWidget {
  MobileDrawer({super.key,});

  @override
  MobileDrawerState createState() => MobileDrawerState();

}

class MobileDrawerState extends State<MobileDrawer> {
  void _showDialog(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.brown[50],
          title: const Text('DayCare Provider or Parent', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
          content: const Text('Are you a DayCare Provider', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
          actions: [
            MaterialButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaycareRegister()),
                );
              },
              child: Text('Yes', style: TextStyle(color: Colors.brown, )),
              ),
              MaterialButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MobileRegister()),
                );
              },
              child: Text('No', style: TextStyle(color: Colors.brown, )),
              ),
          ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  MaterialPageRoute(builder: (context) => AboutUsMobile()),
                );
              },
              title: Text('ABOUT'),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsMobile()),
                );
              },
              title: Text('CONTACT'),
            ),
            ListTile(
              leading: Icon(Icons.login),
              
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                );
              },
              title: const Text('LOGIN HERE'),
            ),
            ListTile(
              leading: Icon(Icons.app_registration_rounded),
              onTap: () {
                _showDialog();},
              title: Text('REGISTER HERE'),
            ),
          ],
        ),
      ),
    );
  }
}
