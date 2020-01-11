import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_categories.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  static const routeName = '/categoryMealsScreen';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  Map<String, String> arguments;
  String categoryId;
  var _loadedData = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedData){
    arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = arguments['title'];
    final categoryId = arguments['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedData = true;
    }else{
      print('Loaded');
      
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (ctx, index) {
            final meal = displayedMeals[index];
            return MealItem(
              removeItem: _removeItem,
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

  void _removeItem(String id) {
    setState(() {
      displayedMeals.removeWhere((item) {
        print(id == item.id);
        return id == item.id;
      });
    });
  }
}
