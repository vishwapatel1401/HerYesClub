import 'package:flutter/material.dart';
import 'package:test_project/components/text_field.dart';
import 'package:test_project/components/top_bar_content.dart';
import 'package:test_project/desktop_view/desktop_register.dart';

class DkLogin extends StatefulWidget {
  const DkLogin({super.key});

  @override
  State<DkLogin> createState() => _DkLoginState();
}

class _DkLoginState extends State<DkLogin> {
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

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    controller: _userNameController,
                    hintText: 'FirstName',
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

                SizedBox(height: 25),
                GestureDetector(
                onTap: (){
                  //signUserIn();
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(horizontal: 25),
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

                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Not a member?'),
                    GestureDetector(
                      onTap: (){
                        DkRegister();
                      },
                      child: Text(' Register Now!',
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