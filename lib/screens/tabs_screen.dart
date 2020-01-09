import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widgets/adaptive_widget.dart';

class TabsScreen extends StatefulWidget {
  //TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: AdaptiveScreen(
          navBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(icon: Icon(Icons.star), text: 'Favorite')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[CategoriesScreen(), FavoriteScreen()],
          )),
      length: 2,
    );
  }
}
