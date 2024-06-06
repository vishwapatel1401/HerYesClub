import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/top_bar_content.dart';

class DesktopProfile extends StatefulWidget {
  const DesktopProfile({super.key});

  @override
  State<DesktopProfile> createState() => _DesktopProfileState();
}

class _DesktopProfileState extends State<DesktopProfile> {
final ScrollController _scrollController = ScrollController();
  double _scrollposition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollposition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollposition < screenSize.height * 0.40
        ? _scrollposition / (screenSize.height * 0.40)
        : 1;

    final height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
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
                  ElevatedButton(
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                  }, child: const Text('SIGN OUT'),
                  ),
                  ],
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