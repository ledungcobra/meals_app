import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';



class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem({this.color, this.title,this.id});
  void selectCategory(BuildContext ctx) {
   // var nextPage = CategoryMealsScreen(categoryID: id,categoryTitle: title,);
    // final pageRoute = Platform.isIOS
    //     ? CupertinoPageRoute(builder: (_) {
    //         return nextPage;
    //       })
    //     : MaterialPageRoute(builder: (_) {
    //         return nextPage;
    //       });

    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,arguments: {'id': id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        
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
      ),
    );
  }
}
