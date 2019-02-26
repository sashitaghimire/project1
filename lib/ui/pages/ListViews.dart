import 'dart:io';
import 'package:flutter/material.dart';
import 'DetailView.dart';
import 'AddItems.dart';

class ListViews extends StatefulWidget {
  @override
  _ListViewsState createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  List item1 = [];
  addItem(String title, String description, File image) {
    setState((){

      item1.add({
        "title": title,
        "description":description,
        "img": image
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Home Page'),
        backgroundColor: Colors.orange,
      ),
       body: ListView.builder(
       itemCount: item1.length,
        itemBuilder: (BuildContext context, int  index) {
          var item =item1[index];
          return ListTile(
             onTap: ()=>Navigator.push(context, MaterialPageRoute(
               builder: (_) => ItemDetails(item:item)
             )), 
                    isThreeLine: true,
            title: Text(item["title"]),
            leading:CircleAvatar(
              backgroundImage:FileImage(item["img"],),
            radius:40,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item["description"]),
                SizedBox(height: 50,),
                ],
                    ),
          );
        },
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor:Colors.orange,
        onPressed:()=>Navigator.push(context,MaterialPageRoute(
          builder: (_)=>AddItem(addItem)
        )),
        tooltip: "Add Items",
         child: Icon(Icons.add) ,   
            ),
    );
  }
}



//  final List item1 = [
//     {
      
//       "title": "Books",
//       "description":" These are fifth semester books",
//       "img":"assets/book.jpg",
//     },
//     {
      
//       "title":"Redmi Note 4",
//       "description":"This is redmi Note 4",
//       "img":"assets/mobile.jpg",
//     },
//     {
     
//      "title": "Mother Teresa",
//       "description":"Mother Teresa is a social worker.",
//       "img":"assets/01.jpg",
//     },
//     {
//       "title": "Kalinchowk",
//       "description":"Kalinchowk Snowfall",
//       "img":"assets/02.jpg", 
//     },
//     ];
