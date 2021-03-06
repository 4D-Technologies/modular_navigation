import 'package:example/pages/login.dart';
import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:example/pages/sub_pages/sub_page2.dart';
import 'package:example/pages/sub_pages/sub_page3.dart';
import 'package:modular_navigation/modular_navigation.dart';

import '../../main.dart';

class SubPagesModule extends SubModule {
  SubPagesModule(RootModule parentModule)
      : super(
          route: "sub",
          parentModule: parentModule,
          guard: (route, delegate) {
            if (MyApp.loggedIn) return true;

            delegate.navigateToPage(
              LoginPage(
                LoginPageParameters(route.uri.toString()),
              ),
              clearHistory: true,
              removeCurrent: true,
            );
            return false;
          },
        );

  ModularRoute<SubPage1Parameters, SubPage1> get page1Route =>
      ModularRoute<SubPage1Parameters, SubPage1>(
        module: this,
        route: "page1",
        createPage: (params) => SubPage1(
          SubPage1Parameters.fromMap(params),
        ),
      );

  NoPageParametersRoute<SubPage2> get page2Route => NoPageParametersRoute(
        module: this,
        route: "page2",
        createPage: () => SubPage2(),
      );

  ModularRoute<IdPageParameters, SubPage3> get page3Route => ModularRoute(
        module: this,
        route: "page3",
        createPage: (params) => SubPage3(IdPageParameters.fromMap((params))),
      );

  @override
  Iterable<BaseModularRoute> get routes => [
        page1Route,
        page2Route,
        page3Route,
      ];
}
