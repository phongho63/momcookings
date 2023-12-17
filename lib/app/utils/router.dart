import 'package:flutter/cupertino.dart';
import 'package:personal_project/app/utils/pages.dart';

import '../pages/home/food_details/food_details_view.dart';

class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  CupertinoPageRoute? getRoute(RouteSettings settings) {
    switch(settings.name) {
    // case Pages.startup:
    //   return _buildRoute(settings, StartupView());

      case Pages.foodDetails:
        return _buildRoute(settings, const FoodDetailsView());
      default:
        return null;
    }
  }

  CupertinoPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return CupertinoPageRoute(
        settings: settings, builder: (context) => builder);
  }
}
