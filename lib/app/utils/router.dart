import 'package:flutter/cupertino.dart';
import 'package:personal_project/app/utils/pages.dart';
import 'package:personal_project/domain/entities/food_info/food_details_info/food_details_info.dart';

import '../pages/home/food_details/food_details_view.dart';

class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  CupertinoPageRoute? getRoute(RouteSettings settings) {
    switch(settings.name) {
    // case Pages.startup:
    //   return _buildRoute(settings, StartupView());

      case Pages.foodDetails:
        Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
        return _buildRoute(settings, FoodDetailsView(
          foodItem: arguments[foodItemParam] as FoodDetailsInfo,
        ));
      default:
        return null;
    }
  }

  CupertinoPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return CupertinoPageRoute(
        settings: settings, builder: (context) => builder);
  }
}
