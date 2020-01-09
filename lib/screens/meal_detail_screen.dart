import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_categories.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/adaptive_widget.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({Key key}) : super(key: key);
  static const String routeName = '/MealDetailScreen';

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((item) => item.id == id);

    return AdaptiveScreen(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            imageWidget(meal),
            buildSectionWidget(context, 'Ingredients'),
            buildListViewOf(meal.ingredients),
            buildSectionWidget(context, 'Steps'),
            SingleChildScrollView(
              child: buildContainer(
                height: 400,
                  child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 1),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            maxRadius: 25,
                            minRadius: 20,
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(
                            '${meal.steps[index]}',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.black),
                          ),
                        ),
                        Divider(color: Colors.black, thickness:0.2,)
                      ],
                    )),
              )),
            )
          ],
        ),
      ),
      navBar: CupertinoNavigationBar(
        middle: Text('${meal.title}'),
      ),
    );
  }

  Container imageWidget(Meal meal) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Container buildContainer(
      {Widget child, double height = 150, double width = 300}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: height,
      width: width,
      child: child,
    );
  }

  Container buildListViewOf(List<String> ingredients) {
    return buildContainer(
      child: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) => Card(
          color: Theme.of(context).accentColor,
          child: Padding(
              padding: EdgeInsets.all(10), child: Text(ingredients[index])),
        ),
      ),
    );
  }

  Container buildSectionWidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(text, style: Theme.of(context).textTheme.title),
    );
  }
}
