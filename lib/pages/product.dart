import 'dart:async';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  
  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //WillPopScope is used to manually take care off the phones back button
    return WillPopScope(onWillPop: () {
      print('Back button pressed');
      Navigator.pop(context, false);
      //To use Future you must import dart:async and this permits to return to the previous page
      return Future.value(false);
    }, child: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(title),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('DELETE'),
              onPressed: () => {
                showDialog(builder: (BuildContext context) {
                  return AlertDialog(title: Text('Are you sure?'), content: Text('This action cannot be undone!'));
                })
              },
            ),
          )
        ],
      ),
    ),);
  }
}
