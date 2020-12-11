import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String imagePath;

  UserImage({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Center(child: Image.asset(this.imagePath)),
      ),
    );
  }
}
