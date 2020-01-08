import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/dummy_categories.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIos = Platform.isIOS;
    final PreferredSizeWidget appBar = isIos
        ? CupertinoNavigationBar(
            middle: Text(
              'Meals App',
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          )
        : AppBar(
            title: Text("Meals App"),
            backgroundColor: Colors.green,
          );
    final bodyPage = SafeArea(
      child: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((item) {
          return CategoryItem(title: item.title, color: item.color);
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
    return isIos
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: bodyPage,
            backgroundColor: Colors.amber[90],
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
          );
  }
}
