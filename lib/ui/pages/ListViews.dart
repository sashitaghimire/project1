import 'package:flutter/material.dart';
import 'DetailView.dart';
import 'AddItems.dart';
class ListViews extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Home Page'),
        backgroundColor: Colors.lightGreen,
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
              backgroundImage:AssetImage(item["img"],),
            radius:30,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               
                 Text(item["description"]),
                SizedBox(height: 10,),
                  
              ],
            ),
          );
        },
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:()=>Navigator.pushReplacement(context,MaterialPageRoute(
          builder: (_)=>AddItem()
        )),
        tooltip: "Add Items",
         child: Icon(Icons.add) ,      ),
      
    );
  }
}
 final List item1 = [
    {
      
      "title": "Cryptograhy",
      "description":"Cryptograpphy is a book",
      "img":"assets/book.jpg",
    },
    {
      
      "title": "Cryptography",
      "description":"aaa",
      "img":"assets/mobile.jpg",
    },
    {
     
     "title": "Cryptography",
      "description":"fffff",
      "img":"",
    },
    {
      "title": "Cryptography",
      "description":"aaaa",
      "img":"", 
    },
    ];


