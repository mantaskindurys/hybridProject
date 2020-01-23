import 'Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  Data myObject;
  ViewScreen({
    this.myObject
  });
  @override
  _ViewScreenState createState() => new _ViewScreenState();

}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(widget.myObject.imageUrl, width: 400, height: 300, fit: BoxFit.contain,),
              Container(child: Text('Title: '+widget.myObject.title, style: TextStyle(fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                padding: new EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
                decoration: BoxDecoration(border: new Border.all(color: Colors.blueAccent, width: 4.0, style: BorderStyle.solid)),
              ),
              Container(child: Text('Description: '+widget.myObject.description, style: TextStyle(fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.all(10.0),
                padding: new EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
                decoration: BoxDecoration(border: new Border.all(color: Colors.blueAccent, width: 4.0, style: BorderStyle.solid)),
              ),
              Container(child: Text('Email: '+widget.myObject.contacts, style: TextStyle(fontWeight: FontWeight.bold)),
                padding: new EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
                decoration: BoxDecoration(border: new Border.all(color: Colors.blueAccent, width: 4.0, style: BorderStyle.solid)),
              ),
            ],
          ),
        )
       );
  }
}