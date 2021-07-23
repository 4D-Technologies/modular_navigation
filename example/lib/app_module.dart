import 'package:example/pages/splash.dart';

import 'pages/home.dart';
import 'pages/sub_pages/sub_module.dart';
import 'package:modular_navigation/modular_navigation.dart';

class AppModule extends RootModule {
  @override
  PageRouteMap get homeRoute => PageRouteMap(
        route: "home",
        createPage: (_, __) => HomePage(),
      );

  @override
  PageRouteMap get initialRoute =>
      PageRouteMap(route: "", createPage: (_, __) => SplashPage());

  @override
  PageRouteMap get notFoundRoute => throw UnimplementedError();

  @override
  Iterable<PageRouteMap> get routeMap => [
        homeRoute,
        initialRoute,
        notFoundRoute,
      ];

  final subModule = SubModule();

  @override
  Iterable<BaseModule> get subModules => [subModule];
}
