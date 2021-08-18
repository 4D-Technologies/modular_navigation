part of modular_navigation;

abstract class RootModule extends BaseModule {
  ModularRoute get initialRoute;
  ModularRoute get homeRoute;
  ModularRoute get notFoundRoute;

  const RootModule();

  @override
  String get route => "/";
}
