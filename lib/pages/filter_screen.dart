import 'package:flutter/material.dart';
import 'package:meal/pages/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  const FilterScreen({
    super.key,
    required this.saveFilters,
    required this.currentFilters,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    bool currentValue,
    void Function(bool) updateValue,
    String title,
    String subTitle,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Your Meal'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 18),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  'Gluten Free',
                  'Only gluten free meals will be included',
                ),
                const SizedBox(height: 18),
                _buildSwitchListTile(
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  'Lactose Free',
                  'Only lactose free meals will be included',
                ),
                const SizedBox(height: 18),
                _buildSwitchListTile(
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  'Vegetarian',
                  'Only vegetarian meals will be included',
                ),
                const SizedBox(height: 18),
                _buildSwitchListTile(
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  'Vegan',
                  'Only vegan meals will be included',
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      onPressed: () {
                        final selectedFilters = {
                          'gluten': _glutenFree,
                          'lactose': _lactoseFree,
                          'vegan': _vegan,
                          'vegetarian': _vegetarian,
                        };
                        widget.saveFilters(selectedFilters);
                      },
                      icon: Icon(
                        Icons.done_all,
                        color: Theme.of(context).toggleableActiveColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
