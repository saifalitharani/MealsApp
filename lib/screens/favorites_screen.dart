
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.length < 1) {
      return Center(
        child: Text('No Favorites added. Starting adding some! '),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: _favoriteMeals[index].id,
              title: _favoriteMeals[index].title,
              imageUrl: _favoriteMeals[index].imageUrl,
              duration: _favoriteMeals[index].duration,
              complexity: _favoriteMeals[index].complexity,
              affordability: _favoriteMeals[index].affordability,
              removeItem: null);
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
