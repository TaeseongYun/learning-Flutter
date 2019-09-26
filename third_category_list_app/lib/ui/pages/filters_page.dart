import 'package:flutter/material.dart';
import '../../ui/widgets/main_drawer.dart';

class FilterPage extends StatefulWidget {
  final Function saveFilters;

final Map<String, bool> currentFilter;

  FilterPage({this.currentFilter, this.saveFilters});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _glutenFree = false;
  bool _veganFree = false;

  bool _vegetarianFree = false;

  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegetarianFree = widget.currentFilter['vegetarian'];
    _veganFree = widget.currentFilter['vegan'];
    super.initState();
  }

  Widget _buildSwtichListTitle(
      String title, String subTitle, bool kindOfFilter, Function updateValue) {
    return SwitchListTile(
      value: kindOfFilter,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter Meals'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _veganFree,
                'vegetarian': _vegetarianFree,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwtichListTitle(
                    "GlueTen", "Only include Glueten meals.", _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwtichListTitle(
                    "Vegeterian",
                    "Only include Vegeterian meals.",
                    _vegetarianFree, (newValue) {
                  setState(() {
                    _vegetarianFree = newValue;
                  });
                }),
                _buildSwtichListTitle(
                    "Vegan", "Only include Vegan meals.", _veganFree,
                    (newValue) {
                  setState(() {
                    _veganFree = newValue;
                  });
                }),
                _buildSwtichListTitle(
                    "Lactose", "Only include Lactose meals.", _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
