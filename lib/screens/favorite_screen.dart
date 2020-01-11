import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  FavoriteScreen(this.favoritedMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoritedMeals.isEmpty) {
      return Center(
        child: Text('Dummy data'),
        
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoritedMeals.length,
        itemBuilder: (ctx, index) {
          final meal = widget.favoritedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
      );
    }
  }
}
