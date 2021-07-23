part of modular_navigation;

abstract class RootModule extends BaseModule {
  PageRouteMap get initialRoute;
  PageRouteMap get homeRoute;
  PageRouteMap get notFoundRoute;

  @override
  String get route => "/";
}
