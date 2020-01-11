import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_categories.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });
    _availableMeals = DUMMY_MEALS.where((item) {
      if (filterData['gluten'] && !item.isGlutenFree ||
          filterData['vegan'] && !item.isVegan ||
          filterData['vegetarian'] && !item.isVegetarian ||
          filterData['lactose'] && !item.isLactoseFree) {
        //Exclude gluten food;
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavorite(String mealId) {
    int existingIndex = _favoritedMeals.indexWhere((item) => item.id == mealId);
    setState(() {
      if (existingIndex == -1) {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((item) => item.id == mealId));
      } else {
        _favoritedMeals.removeAt(existingIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      home: Material(child: TabsScreen(_favoritedMeals)),
      initialRoute: '/',
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters)
      },
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
            builder: (ctx) => CategoryMealsScreen(_availableMeals));
      },
    );
  }
  bool _isMealFavorite(String id){
    return _favoritedMeals.any((item)=>item.id == id);
  }
}
