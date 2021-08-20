import 'package:example/pages/login.dart';
import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:example/pages/sub_pages/sub_page2.dart';
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

  @override
  Iterable<ModularRoute> get routes => [
        ModularRoute<SubPage1Parameters, SubPage1>(
          module: this,
          route: "page1",
          createPage: (params) => SubPage1(
            SubPage1Parameters.fromMap(params),
          ),
        ),
        ModularRoute<NoPageParameters, SubPage2>(
          module: this,
          route: "page2",
          createPage: (_) => SubPage2(),
        ),
      ];
}
