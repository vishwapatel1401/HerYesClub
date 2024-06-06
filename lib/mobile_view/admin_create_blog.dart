import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:test_project/components/text_field.dart';
import 'package:test_project/mobile_view/mobile_admin_blog.dart';
import 'package:test_project/pages/about_page.dart';
import 'package:test_project/pages/contact_page.dart';
import 'package:test_project/pages/home_page.dart';

class AdminCreateBlog extends StatefulWidget {
  const AdminCreateBlog({super.key});

  @override
  State<AdminCreateBlog> createState() => AdminCreateBlogState();
}

class AdminCreateBlogState extends State<AdminCreateBlog> {
    String selected_file = '';
    var image;
    var downloadUrl;
    bool isLoading = false;
    final picker = ImagePicker();

  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void selectFile() async{
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null){
      setState((){
        image = result.files.first.name;
      });

      image = result.files.first.bytes;
    }
  }

  uploadBlogs() async{
    if(image != null){
      setState((){
        isLoading = true;
      });

      Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child("blogImages")
        .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = firebaseStorageRef.putData(image);
      await task.whenComplete(() async {
        try{
          downloadUrl = await firebaseStorageRef.getDownloadURL();
        }
        catch(onError){
          print("Error");
        }
      });

      addBlogData(
        downloadUrl,
        _authorController.text.trim(),
        _titleController.text.trim(),
        _descriptionController.text.trim()).
        then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminBlog())));
    }
    }

    Future addBlogData(var downloadUrl, String author, String title, String description) async{
          FirebaseFirestore.instance.collection("blogs").add({
            "downloadUrl": downloadUrl,
            "author": author,
            "title": title,
            "description": description
          });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        title: const Text("CREATE BLOGSS!",
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold
        ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              uploadBlogs();
            },
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.file_upload),
          ),
          )
        ],
      ),
      backgroundColor: Colors.brown[50],
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
              leading: Icon(Icons.post_add),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminBlog()),
                );
              },
              title: Text('BLOGSS'),
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
    
    body: isLoading ?
    Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ) :
    Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              selectFile();
            },
            child: image != null ? Container(
              child: Image.memory(image!,
              height: 150,
              width: MediaQuery.of(context).size.width,
              ),
            )
          : Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)
            ),
            width: MediaQuery.of(context).size.width,
            child: Icon(Icons.add_a_photo_outlined,
            color: Colors.brown,),
          ),
          ),
          SizedBox(height: 10,),
          MyTextField(
            controller: _authorController,
            hintText: "Author's Name",
            obscureText: false,
            maxLines: 1,),

          SizedBox(height: 10,),
          MyTextField(
            controller: _titleController,
            hintText: "Blog Title",
            obscureText: false,
            maxLines: 1,),

          SizedBox(height: 10,),
          MyTextField(
            controller: _descriptionController,
            hintText: "Blog Content",
            obscureText: false,
            maxLines: 10,),
        ]
        ),
    ),
    );
  }
}