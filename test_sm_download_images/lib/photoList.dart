import 'package:flutter/material.dart';

import 'nextScreen.dart';

class PhotosList extends StatefulWidget {
  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: <Widget>[
        FlatButton(
          child: Text("UPLOAD .. "),

        ),
        FlatButton(
          child: Text("next .. "),
          onPressed: (){ Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NextScreen()),
          );},
        ),
      ],
    ));
  }
}
