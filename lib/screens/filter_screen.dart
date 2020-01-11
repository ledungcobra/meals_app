import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({Key key}) : super(key: key);
  static const String routeName = '/FilterScreen';
  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.saveFilter, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilterData = {
                'gluten': widget.currentFilters['gluten'],
                'lactose': widget.currentFilters['lactose'],
                'vegan': widget.currentFilters['vegan'],
                'vegetarian': widget.currentFilters['vegetarian']
              };
              widget.saveFilter(selectedFilterData);
            },
          )
        ],
        title: Text('Your Filters'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchListTile('Gluten-free', 'Make it posible',
                  widget.currentFilters['gluten'], (value) {
                setState(() {
                  widget.currentFilters['gluten'] = value;
                });
              }),
              buildSwitchListTile('Vegetarian', 'Do it your self',
                  widget.currentFilters['vegetarian'], (newValue) {
                setState(() {
                  widget.currentFilters['vegetarian'] = newValue;
                });
              }),
              buildSwitchListTile('Lactose-free', 'Do it your self',
                  widget.currentFilters['lactose'], (newValue) {
                setState(() {
                  widget.currentFilters['lactose'] = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegan', 'Do it your self', widget.currentFilters['vegan'],
                  (newValue) {
                setState(() {
                  widget.currentFilters['vegan'] = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile.adaptive(
      activeColor: Colors.orange,
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
    );
  }
}
