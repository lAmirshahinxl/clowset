import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final icon;
  final controller;
  CircleButton({this.icon,this.controller});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: controller,
      child: Container(
        width: 22,
        height: 22,
        child: Icon(icon, size: 20,color:Colors.black.withOpacity(0.5) ,),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.5),width: 1),
            shape: BoxShape.circle,
            ),
      ),
    );
  }
}