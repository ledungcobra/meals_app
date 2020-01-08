import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem({this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
          child: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      )),
      decoration: BoxDecoration(
        color: this.color,
        gradient: LinearGradient(
          colors: [color.withOpacity(0.6), color],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
