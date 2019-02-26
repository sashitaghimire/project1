import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'ListViews.dart';
import 'dart:io';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  File image;
  picker()async{
    print("Picker is called");
    File img = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (img != null){
      print(img.path);
      setState(() {
          image=img;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.orange,
        title: Text('Add Items'),
      ),
body: ListView(
  padding: EdgeInsets.all(15),
  children: <Widget>[
   TextField(
     decoration:InputDecoration(
       border:OutlineInputBorder(
       ),
       hintText: "title",
prefixIcon: Icon(Icons.title)
     ),
   ) ,
   SizedBox(height: 30,width: 40,),
   TextField(
     decoration: InputDecoration(
       border: OutlineInputBorder(

       ),
       hintText: "Description",
     ),

   ),
   SizedBox(height:30,width: 30,),
   SizedBox(height: 30,width: 30,
   child:FlatButton.icon(
     icon:Icon(Icons.camera),
     label: Text("Add Images"),
     color: Colors.orange,
     onPressed: picker,
   ),
   ),
   SizedBox(height: 30,width:30),
   SizedBox(
     height: 400,
     child: image== null ? Container() :Image.file(image,height: 40,),
   ),SizedBox(height:20),
   SizedBox(height:30,width:30,
   child: RaisedButton.icon(
icon:Icon(Icons.save),
label:Text("Save"),
color:Colors.orange,
onPressed: (){
   Navigator.push(context, MaterialPageRoute(builder: 
   (context)=>ListViews()
   )
   );
},
   ),
   ),
  ],
),
    );
  }
}