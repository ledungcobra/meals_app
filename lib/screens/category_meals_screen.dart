import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_categories.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categoryMealsScreen';
  CategoryMealScreen(){
    
  }

  // final String categoryID;
  // final String categoryTitle;
  // CategoryMealsScreen({this.categoryID,this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = arg['title'];
    final categoryId = arg['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            final meal = categoryMeals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
            );
          },
        ));
  }
}
