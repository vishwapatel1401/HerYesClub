import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/button.dart';
import 'package:test_project/components/text_field.dart';
import 'package:test_project/components/top_bar_content.dart';
import 'package:test_project/desktop_view/desktop_auth.dart';
import 'package:test_project/desktop_view/desktop_login.dart';

class DkRegister extends StatefulWidget {
  DkRegister({super.key});

  @override
  State<DkRegister> createState() => _DkRegisterState();
}

class _DkRegisterState extends State<DkRegister> {
final ScrollController _scrollController = ScrollController();
double _scrollposition = 0;
double _opacity = 0;

_scrollListener() {
  setState(() {
    _scrollposition = _scrollController.position.pixels;
  });
}

@override
void initState(){
  _scrollController.addListener(_scrollListener);
  super.initState();
}

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
        password: _passwordController.text.trim());

      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        _streetController.text.trim(),
        _cityController.text.trim(),
        _countryController.text.trim(),
        _postalCodeController.text.trim(),
        int.parse(_phonenumController.text.trim())).then(
          (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => DesktopAuth())));
    }
  }

  Future addUserDetails(String firstName, String lastName, String email, String street,
  String city, String country, String postalCode, int phoneNum) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'street': street,
      'city': city,
      'country': country,
      'postalCode': postalCode,
      'phoneNum': phoneNum,
    });
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
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollposition < screenSize.height * 0.40
    ? _scrollposition / (screenSize.height * 0.40)
    : 1;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.brown[50],
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: TopBarContents(_opacity),),
      resizeToAvoidBottomInset: true,

    body: SingleChildScrollView(
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hyc4.JPG'))
                ),
              )
              ),
              Expanded(
                child: Container(
                height: height,
                color: Colors.brown[50],
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _firstNameController,
                    hintText: 'FirstName',
                    obscureText: false,
                    maxLines: 1,
                  ),

                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _lastNameController,
                    hintText: 'LastName',
                    obscureText: false,
                    maxLines: 1,
                  ),

                  const SizedBox(height: 10),
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
                      obscureText: false,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 10,
                    width: 10,),
                    MyTextField(
                      controller: _cityController,
                      hintText: 'City',
                      obscureText: false,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 10,
                  width: 10,),
                  MyTextField(
                    controller: _postalCodeController,
                    hintText: 'Postal Code',
                    obscureText: false,
                    maxLines: 1,
                  ),

                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _phonenumController,
                    hintText: 'Phone Number',
                    obscureText: false,
                    maxLines: 1,
                  ),

                  SizedBox(height: 10),
                  MyTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    maxLines: 1,
                  ),

                  SizedBox(height: 10),
                  MyTextField(
                    controller: _cpasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    maxLines: 1,
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
                        MaterialPageRoute(builder: (context) => DkLogin()),
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
                  ),
                )
                )
              )
          ],
        ),
      ),
    ),
      );
  }
}