import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(15),
          borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        splashColor: Colors.grey,
        child: Icon(
          Icons.search,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
