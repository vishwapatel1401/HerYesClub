import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/button.dart';
import 'package:test_project/components/mobile_drawer.dart';
import 'package:test_project/components/text_field.dart';
import 'package:test_project/mobile_view/mobile_login.dart';
import 'package:test_project/pages/auth_page.dart';

class MobileRegister extends StatefulWidget {
  //final VoidCallback showLoginPage;
  MobileRegister({super.key,});

  @override
  State<MobileRegister> createState() => _MobileRegisterState();

}

class _MobileRegisterState extends State<MobileRegister> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();


  Future signUp() async{

    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),);

      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _userNameController.text.trim(),
        _emailController.text.trim(),
        _streetController.text.trim(),
        _cityController.text.trim(),
        _countryController.text.trim(),
        _postalCodeController.text.trim(),
        int.parse(_phonenumController.text.trim()),
        _passwordController.text.trim()).then(
          (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage())));
    }
  }

  Future addUserDetails(String firstName, String lastName, String userName, String email, String street,
  String city, String country, String postalCode, int phoneNum, String password) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'user name': userName,
      'email': email,
      'street': street,
      'city': city,
      'country': country,
      'postalCode': postalCode,
      'phoneNum': phoneNum,
      'password': password,
      'role': 'user'    });
  }

  @override
  void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _postalCodeController.dispose();
    _phonenumController.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();

    super.dispose();
  }


  bool passwordConfirmed(){
    if(_passwordController.text.trim() ==
    _cpasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        title: const Text("REGISTER HERE",
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      drawer: MobileDrawer(),

      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [

            const SizedBox(height: 50),
            const Text('Join the Club today!!!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.brown
            ),),

            const SizedBox(height: 20),
            MyTextField(
              controller: _firstNameController,
              hintText: 'FirstName',
              obscureText: false,
              maxLines: 1,
            ),

            const SizedBox(height: 20),
            MyTextField(
              controller: _lastNameController,
              hintText: 'LastName',
              obscureText: false,
              maxLines: 1,
            ),

            const SizedBox(height: 20),
            MyTextField(
              controller: _userNameController,
              hintText: 'UserName',
              obscureText: false,
              maxLines: 1,
            ),

            const SizedBox(height: 20),
            MyTextField(
              controller: _emailController,
              hintText: 'EmailAddress',
              obscureText: false,
              maxLines: 1,
            ),

            const SizedBox(height: 10,
            width: 10,),
            MyTextField(
              controller: _streetController,
              hintText: 'Street',
              obscureText: false,
              maxLines: 1,
            ),

            const SizedBox(height: 10,
              width: 10,),
              MyTextField(
                controller: _countryController,
                hintText: 'Country',
                obscureText: false, maxLines: 1,
              ),

              const SizedBox(height: 10,
              width: 10,),
              MyTextField(
                controller: _cityController,
                hintText: 'City',
                obscureText: false, maxLines: 1,
              ),

              const SizedBox(height: 10,
            width: 10,),
            MyTextField(
              controller: _postalCodeController,
              hintText: 'Postal Code',
              obscureText: false, maxLines: 1,
            ),

            const SizedBox(height: 20),
            MyTextField(
              controller: _phonenumController,
              hintText: 'Phone Number',
              obscureText: false, maxLines: 1,
            ),

            SizedBox(height: 20),
            MyTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true, maxLines: 1,
            ),

            SizedBox(height: 20),
            MyTextField(
              controller: _cpasswordController,
              hintText: 'Confirm Password',
              obscureText: true, maxLines: 1,
            ),

            const SizedBox(height: 25),
            MyButton(
              onTap: (){
                signUp();
              }
            ),

            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Already a member? '),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MobileLogin()),
                );
                },
                child: Text(' Sign In',
                style: TextStyle(
                  color: Colors.blue
            ),
            )
              )
            ],
            )
        ]
        ),
      )
    ),
    );
  }
}