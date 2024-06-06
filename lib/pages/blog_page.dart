import 'package:flutter/material.dart';
import 'package:test_project/desktop_view/desktop_blog.dart';
import 'package:test_project/medium_view/medium_blog.dart';
import 'package:test_project/mobile_view/mobile_blog.dart';
import 'package:test_project/responsive_views/responsive_layout.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScreen: MobileBlog(),
        mediumScreen: MediumBlog(),
        desktopScreen: DesktopBlog(),
      ),
    );
  }
}