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
      source: ImageSource.gallery
    );
    if (img != null){
      image=img;
      print(img.path);
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.lightGreen,
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
     color: Colors.green,
     onPressed: picker,
   ),
   ),
   SizedBox(height: 30,width:30),
   SizedBox(
     height: 400,
     child: image== null ? null :Image.file(image),
   ),SizedBox(height:20),
   SizedBox(height:30,width:30,
   child: RaisedButton.icon(
icon:Icon(Icons.save),
label:Text("Save"),
color:Colors.green,
onPressed: (){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: 
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