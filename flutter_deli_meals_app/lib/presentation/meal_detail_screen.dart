import 'package:flutter/material.dart';
import 'package:flutter_deli_meals_app/dummy_data.dart';
import 'package:flutter_deli_meals_app/widgets/meal_detail_list_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        actions: [
          IconButton(
            icon: Icon(isMealFavorite(mealId)
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () => toggleFavorite(mealId),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SectionTitleWidget(title: 'Ingredients'),
            MealDetailListItem(listItems: selectedMeal.ingredients),
            SectionTitleWidget(title: 'Recipe Steps'),
            MealDetailListItem(listItems: selectedMeal.steps)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget({
    Key key,
    @required String this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
