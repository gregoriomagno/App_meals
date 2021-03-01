import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../models/category.dart';
import '../components/meal_item.dart';
class CategoriaMealsScreen extends StatelessWidget {
  final List<Meal> meals;
 const  CategoriaMealsScreen(this.meals);
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
