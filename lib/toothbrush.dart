import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';  
//need to fix code to use this and look the same as the others

class ToothbrushPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toothbrush'),
      ),
      body: Center(
        child: Text('Welcome to the Toothbrushes page!'),
      ),
    );
  }
}
