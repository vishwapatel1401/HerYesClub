import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/top_bar_content.dart';

class DesktopBlog extends StatefulWidget {
  DesktopBlog({super.key});

  @override
  State<DesktopBlog> createState() => _DesktopBlogState();
}

class _DesktopBlogState extends State<DesktopBlog> {
final ScrollController _scrollController = ScrollController();
double _scrollposition = 0;
double _opacity = 0;

_scrollListener() {
  setState(() {
    _scrollposition = _scrollController.position.pixels;
  });
}

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
  _scrollController.addListener(_scrollListener);
  super.initState();

  showBlogs();
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
                isLoaded? Container(
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
