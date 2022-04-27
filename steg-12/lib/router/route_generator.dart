import 'package:flutter/material.dart';
import 'package:progit_activity_booker/screens/activity_detail_screen.dart';
import 'package:progit_activity_booker/screens/home_screen.dart';
import 'package:progit_activity_booker/screens/log_in_screen.dart';
import 'package:progit_activity_booker/screens/tabs/tab_screen.dart';
import 'package:progit_activity_booker/services/size_service.dart';

class BaseRoute {
  final Widget Function(String? path) builder;

  BaseRoute(this.builder);

  dynamic generatePage({
    String? path,
    required RouteSettings settings,
  }) {
    return SizeService.instance.isLargeScreen
        ? PageRouteBuilder(
            settings: settings,
            pageBuilder: (ctx, animation, animation2) => builder(path))
        : MaterialPageRoute(builder: (_) => builder(path), settings: settings);
  }
}

class HomeRoute extends BaseRoute {
  HomeRoute() : super((_) => HomeScreen());

  static const path = '/home';
}

class ActivityRoute extends BaseRoute {
  ActivityRoute()
      : super((path) => ActivityDetailsScreen(
              activityId: path,
            ));

  static const path = '/activity';
}

class TabsRoute extends BaseRoute {
  TabsRoute() : super((_) => TabScreen());

  static const path = '/';
}

class LogInRoute extends BaseRoute {
  LogInRoute() : super((_) => LoginScreen());

  static const path = '/logged-out';
}

class ErrorRoute extends BaseRoute {
  ErrorRoute()
      : super(
          (_) => const Scaffold(
            body: Center(
              child: Text("Not found"),
            ),
          ),
        );
}

Route<dynamic> mainRouteMapper(RouteSettings settings) {
  final route = settings.name;
  final args = settings.arguments as String?;

  switch (route) {
    case TabsRoute.path:
      return TabsRoute().generatePage(settings: settings);
    case HomeRoute.path:
      return HomeRoute().generatePage(settings: settings);
    case ActivityRoute.path:
      return ActivityRoute().generatePage(path: args, settings: settings);
    default:
      return ErrorRoute().generatePage(settings: settings);
  }
}

Route<dynamic> activityRouteMapper(RouteSettings settings) {
  final route = settings.name;
  final args = settings.arguments as String?;
  var uri = Uri.parse(route ?? '');

  print(route);
  switch (route) {
    case ActivityRoute.path:
      return ActivityRoute().generatePage(path: args, settings: settings);
    default:
      return HomeRoute().generatePage(settings: settings);
  }
}

class RouteGenerator {
  Route<dynamic> generateMainRoute(RouteSettings settings) {
    return mainRouteMapper(settings);
  }

  Route<dynamic> generateActivityRoute(RouteSettings settings) {
    return activityRouteMapper(settings);
  }
}
