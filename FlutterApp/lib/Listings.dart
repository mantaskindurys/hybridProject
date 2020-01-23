import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Create.dart';
import 'package:flutter_app/Data.dart';

import 'ListingView.dart';


final CollectionReference storeRef = Firestore.instance.collection('listings');

class Listings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var navigationResult = await Navigator.push(
                context, new MaterialPageRoute(builder: (context) => ImageCapture()));

            if (navigationResult == 'from_back') {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Navigation from back'),
                  ));
            } else if (navigationResult == 'from_button') {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Navigation from button'),
                  ));
            }
          },
          child: Icon(Icons.add)
        ),
        appBar: AppBar(title: Text('test')),
          body: StreamBuilder(
            stream: storeRef.snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(itemExtent: 80.0, itemCount: snapshot.data.documents.length ,itemBuilder: (context, index)=>
          _buildListItem(context,snapshot.data.documents[index]),
          );
        }
      )
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title: Row(
        children:[
        Container(
          decoration: const BoxDecoration(color: Color(0xffddddff),),
        padding: const EdgeInsets.all(10.0),
          child: Text(
            document['title'],
            style: Theme.of(context).textTheme.display1,
          )
        )
        ]
    ),
      onTap: (){
        Data item = new Data(document['title'], document['description'], document['imgUrl'], document['email']);
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (__) => new ViewScreen(myObject:item)));
      },
    );
  }

}
