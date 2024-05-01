import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/layouts/home.dart';

class splashScreen extends StatefulWidget {
  @override
  splash createState() => splash();
}

class splash extends State<splashScreen>  {
  static const String routeName = "splash";

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 10),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => home())));


    var assetsImage = new AssetImage(
        'assets/images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height:300); //<- Creates a widget that displays an image.

    return MaterialApp(
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Center(
            child: image,
          ),
        ), //<- place where the image appears
      ),
    );
  }
}