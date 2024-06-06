import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserStatus extends StatefulWidget {
  const UserStatus({super.key});

  @override
  State<UserStatus> createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> {

  String role = 'user';

  @override
  void initState() {
    super.initState();
    checkRole();
  }

  void checkRole() async{

    User? user = FirebaseAuth.instance.currentUser;
    
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
    
    setState(() {
      role = snap['role'];
    });

  //   if(role =='user'){
  //     Timer(Duration(milliseconds: 200), () {
  //     //   Navigator.push(
  //     // context,
  //     // MaterialPageRoute(builder: (context) => MobileProfile()),
  //   );
  //     });
  //   }else if(role == 'admin'){
  //     Timer(Duration(milliseconds: 200), () {
  //       Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MobileBlog()),
  //   );

  //     });
  //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}