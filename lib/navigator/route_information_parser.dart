part of modular_navigation;

class ModularRouteInformationParser
    extends RouteInformationParser<ModularRouteInformation> {
  final RootModule rootModule;

  ModularRouteInformationParser({
    required this.rootModule,
  });

  @override
  Future<ModularRouteInformation> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '/');

    final parameters = routeInformation.state as Map<String, String?>?;
    return SynchronousFuture(
      ModularRouteInformation(
        route: uri.path,
        parameters: parameters ?? uri.queryParameters,
      ),
    );
  }

  @override
  RouteInformation? restoreRouteInformation(
          ModularRouteInformation configuration) =>
      RouteInformation(
        location: configuration.route,
        state: configuration.parameters,
      );
}
