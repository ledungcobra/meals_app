import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/dummy_categories.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((item) {
          return CategoryItem(
            title: item.title,
            color: item.color,
            id: item.id,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //Width of item
            maxCrossAxisExtent: 200,
            //Width 200 ,height 300;

            childAspectRatio: 300 / 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
    return content;
  }
}
