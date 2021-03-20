import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_deli_meals_app/presentation/category_meals_screen.dart';
import 'package:flutter_deli_meals_app/presentation/meal_detail_screen.dart';
import 'package:flutter_deli_meals_app/presentation/tabs_screen.dart';

import 'presentation/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1.0),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1.0),
                ),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // returns to a pre-established Screen and allows executing code based
      // on if conditions

      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },

      // this comes to action when flutter fails to generate a route, prevents
      // crashes guaranteeing that you always show something on the screen
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
