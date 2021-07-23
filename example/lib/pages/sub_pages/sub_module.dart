import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:modular_navigation/modular_navigation.dart';

class SubModule extends BaseModule {
  @override
  String get route => '/sub';

  final subPageOne = PageRouteMap<SubPage1Parameters>(
    route: '/subPage1',
    createPage: (context, params) => SubPage1(params!),
  );

  @override
  Iterable<PageRouteMap> get routeMap => [subPageOne];

  @override
  Iterable<BaseModule> get subModules => [];
}
