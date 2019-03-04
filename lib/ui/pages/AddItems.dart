import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddItem extends StatefulWidget {
  final Function add;
  AddItem(this.add);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  File _image;
  String title;
  String description;
  _showOptionsDialog () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 180,
            child: Column(
              children: <Widget>[
                Container(color: Colors.grey.shade200,
                  child: ListTile(title: Text("Image picker option"),),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text("Select Image"),
                  onTap: (){
                     _getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a picture"),
                  onTap: (){
                    _getImage(ImageSource.camera);
                    Navigator.pop(context);
                  } 
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  Future _getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source:source);
    if(image != null) {
      setState(() {
        _image = image;
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
     onChanged: (value){
       setState((){
         title = value;
       });
     },
     decoration:InputDecoration(
       border:OutlineInputBorder(
       ),
       hintText: "title",
prefixIcon: Icon(Icons.title)
     ),
   ) ,
   SizedBox(height: 30,width: 40,),
   TextField(
     onChanged: (value){
       setState((){
         description = value;
       });
     },
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
     onPressed: _showOptionsDialog,
   ),
   ),
   SizedBox(height: 30,width:30),
   SizedBox(
     height: 400,
     child: _image== null ? Container() :Image.file(_image,height: 40,),
   ),SizedBox(height:20),
   SizedBox(height:30,width:30,
   child: RaisedButton.icon(
icon:Icon(Icons.save),
label:Text("Save"),
color:Colors.orange,
onPressed: (){
  widget.add(title,description, _image);
   Navigator.pop(context);
},
   ),
   ),
  ],
),
    );
  }
}