import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/mobile_drawer.dart';
import 'package:test_project/components/text_field.dart';
import 'package:test_project/mobile_view/mobile_register.dart';

class MediumLogin extends StatefulWidget {

  MediumLogin({super.key,});

  @override
  State<MediumLogin> createState() => MediumLoginState();
}

class MediumLoginState extends State<MediumLogin> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUserIn() async{

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
    );
    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        WrongEmailEntered();
      } else if(e.code == 'wrong-password'){
        WrongPasswordEntered();
      }
    }

  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void WrongEmailEntered(){
    var context;
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
  },
    );
  }

  void WrongPasswordEntered(){
    var context;
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
  },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        title: const Text("HER YES CLUB"),
      ),
      drawer: MobileDrawer(),

    body: SafeArea(
      child: Center(
        child: Column(
          children: [

            const SizedBox(height: 50),
            const Text('Sign In Now!!!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.brown
            ),),

            
            const SizedBox(height: 20),
            MyTextField(
              controller: _emailController,
              hintText: 'EmailAddress',
              obscureText: false, maxLines: 1,
            ),

            const SizedBox(height: 20),
            MyTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
              maxLines: 1,
            ),

            const SizedBox(height: 25),
            GestureDetector(
            onTap: (){
              signUserIn();
            },
            child: Container(
              padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text("Sign In",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),)),
            ),
            ),

            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Not a member?'),
              GestureDetector(
                onTap: (){
                  // widget.showRegisterPage;
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MobileRegister()),
                );
                },
                child: const Text(' Register Now!',
                style: TextStyle(
                  color: Colors.blue
            ),
            )
              )
            ],
            )
          ],
        ),
    ),
    ),
    );
  }
}