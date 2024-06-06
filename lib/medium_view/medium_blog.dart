import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/pages/about_page.dart';
import 'package:test_project/pages/home_page.dart';

class MediumBlog extends StatefulWidget {
  const MediumBlog({super.key});

  @override
  State<MediumBlog> createState() => _MediumBlogState();
}

class _MediumBlogState extends State<MediumBlog> {
  var collection = FirebaseFirestore.instance.collection("blogs");
  late List<Map<String, dynamic>> items;
  bool isLoaded = false;

  showBlogs() async{
    List<Map<String, dynamic>> tempList =[];
    var data = await collection.get();

    data.docs.forEach((element) {
      tempList.add(element.data());
    });
    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  void initState(){
    super.initState();

    showBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        title: const Text("HYC BLOGSS!",
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold
        ),
        ),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ),
                // );
              },
              title: Text('CONTACT'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MobileProfile()),
                // );
              },
              title: Text('PROFILE'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              title: const Text('LOGOUT'),
            ),
          ],
        ),
      ),
    ),
    body: isLoaded? Container(
      child: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: items.length,
            itemBuilder: (context, index){
              return BlogTile(
                imageUrl: items[index]['downloadUrl'],
                title: items[index]['title'],
                description: items[index]['description'],
                author: items[index]['author']);
            })
        ],
      ),
    ) : Material(child: Center(child: CircularProgressIndicator(),),)
      
    );
  }
}

// ignore: must_be_immutable
class BlogTile extends StatelessWidget{
  String imageUrl, title, description, author;

  BlogTile({required this.imageUrl, required this.title, required this.description,
  required this.author});
  @override
  Widget build(BuildContext context){
  return GestureDetector(
    onTap: (){},
    child: Container(
    margin: EdgeInsets.only(bottom: 15),
    height: 150,
    child: Stack(
      children: [
        ClipRRect(
        child: Image.network(imageUrl,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,),
        borderRadius: BorderRadius.circular(6),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6)
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),),
              Text(description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),),
              Text(author,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),)
            ]),
        )
      ],
    ),
    ),
  );
}

}
