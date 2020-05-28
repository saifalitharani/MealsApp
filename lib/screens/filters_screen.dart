import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Map<String, bool> appliedFilters;
  final Function saveFilters;

  FilterScreen(this.appliedFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.appliedFilters['gluten'];
    _vegan = widget.appliedFilters['vegan'];
    _vegetarian = widget.appliedFilters['vegetarian'];
    _lactoseFree = widget.appliedFilters['lactose'];
  }

  Widget buildSwitchListTileForFilters(
      String title, String subtitle, bool currentVal, Function updateVal) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentVal,
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> _appliedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(_appliedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildSwitchListTileForFilters(
            'Gluten-Free',
            'Only includes the gluten free',
            _glutenFree,
            (newVal) {
              setState(() {
                _glutenFree = newVal;
              });
            },
          ),
          buildSwitchListTileForFilters(
            'Vegan',
            'Only includes the vegan',
            _vegan,
            (newVal) {
              setState(() {
                _vegan = newVal;
              });
            },
          ),
          buildSwitchListTileForFilters(
            'Vegetarian',
            'Only includes the vegetarian',
            _vegetarian,
            (newVal) {
              setState(() {
                _vegetarian = newVal;
              });
            },
          ),
          buildSwitchListTileForFilters(
            'Lactose-Free',
            'Only include the lactose free',
            _lactoseFree,
            (newVal) {
              setState(() {
                _lactoseFree = newVal;
              });
            },
          ),
        ],
      ),
    );
  }
}
