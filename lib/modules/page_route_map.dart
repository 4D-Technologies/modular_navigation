part of modular_navigation;

class PageRouteMap<TParameters extends PageParameters> {
  final String route;
  final Widget Function(BuildContext context, TParameters? parameters)
      createPage;

  PageRouteMap({required this.route, required this.createPage});
}
