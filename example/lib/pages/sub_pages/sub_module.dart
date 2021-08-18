import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:example/pages/sub_pages/sub_page2.dart';
import 'package:modular_navigation/modular_navigation.dart';

class SubPagesModule extends SubModule {
  @override
  String get route => parentRoute + "sub";

  SubPagesModule(String parentRoute) : super(parentRoute);

  @override
  Iterable<ModularRoute> get routes => [
        ModularRoute<SubPage1Parameters, SubPage1>(
          route: "page1",
          createPage: (params) => SubPage1(
            SubPage1Parameters.fromMap(params),
          ),
        ),
        ModularRoute<NoPageParameters, SubPage2>(
          route: "page2",
          createPage: (_) => SubPage2(),
        ),
      ];
}
