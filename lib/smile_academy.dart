import 'package:flutter/material.dart';

class SmileAcademy extends StatelessWidget {
  const SmileAcademy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0051C1),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const SafeArea(
          child: Center(
            child: Text(
              'Smile Academy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Source Serif Pro',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
