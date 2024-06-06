import 'package:flutter/material.dart';
import 'package:test_project/components/mobile_drawer.dart';

class MobileSearch extends StatefulWidget {
  const MobileSearch({super.key});

  @override
  State<MobileSearch> createState() => _MobileSearchState();
}

class _MobileSearchState extends State<MobileSearch> {
  TextEditingController searchcontroller = TextEditingController();

  // Reference ref = FirebaseFirestore.instance.collection("users").get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SEARCH FOR DAYCARE PROVIDERS',
        style: TextStyle(color: Colors.brown),),
      ),
      drawer: MobileDrawer(),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: Padding(padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          color: Colors.brown
                        ),
                        controller: searchcontroller,
                        decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)
                    ),
                      hintText: 'Search',
                      icon: Icon(Icons.search_outlined),
                      suffixIcon: searchcontroller == null?
                      null
                      : IconButton(
                        icon: Icon(Icons.cancel_outlined),
                        onPressed: (){
                        searchcontroller.clear();
                        }
                        ),
                      
                      ),
                      ),
                      )
                  ]),
                )
              )
            ]
          ),
        ),
        ),
    );
  }
}