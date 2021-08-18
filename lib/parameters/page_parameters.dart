part of modular_navigation;

abstract class PageParameters extends Object {
  @protected
  final Map<String, String?> _map;

  const PageParameters(Map<String, String?> map) : _map = map;

  Map<String, String?> get map => _map;
}
