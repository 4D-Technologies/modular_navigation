import 'package:example/pages/login.dart';
import 'package:example/pages/not_found.dart';

import 'pages/home.dart';
import 'package:modular_navigation/modular_navigation.dart';

import 'pages/sub_pages/sub_module.dart';

class AppModule extends RootModule {
  late SubPagesModule subPagesModule;

  AppModule() {
    subPagesModule = SubPagesModule(this);
  }

  ModularRoute<LoginPageParameters, LoginPage> get loginRoute =>
      ModularRoute<LoginPageParameters, LoginPage>(
        module: this,
        route: "login",
        createPage: (params) => LoginPage(
          LoginPageParameters.fromMap(params),
        ),
      );

  @override
  NoPageParametersRoute<HomePage> get homeRoute => NoPageParametersRoute(
        module: this,
        route: "",
        createPage: () => HomePage(),
      );

  @override
  NoPageParametersRoute<HomePage> get initialRoute =>
      homeRoute; //This can be a splash screen if you have more configuration to complete and then navigate away once you're done as an example.

  @override
  NoPageParametersRoute<NotFoundPage> get notFoundRoute =>
      NoPageParametersRoute(
        module: this,
        route: "/notfound",
        createPage: () => NotFoundPage(),
      );

  @override
  Iterable<BaseModularRoute> get routes => [
        homeRoute,
        initialRoute,
        notFoundRoute,
        loginRoute,
      ];

  @override
  Iterable<BaseModule> get subModules => [
        subPagesModule,
      ];
}
