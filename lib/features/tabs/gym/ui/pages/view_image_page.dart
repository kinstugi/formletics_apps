import 'package:flutter/material.dart';



class ViewImagePage extends StatefulWidget {
  final int currentIndex;
  final List<String> images;

  const ViewImagePage({this.images, this.currentIndex});

  @override
  _ViewImagePageState createState() => _ViewImagePageState();
}

class _ViewImagePageState extends State<ViewImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

    );
  }
}
