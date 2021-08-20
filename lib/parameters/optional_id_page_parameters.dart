part of modular_navigation;

class OptionalIdPageParameters extends PageParameters {
  OptionalIdPageParameters([String? id]) : super({"id": id});

  OptionalIdPageParameters.fromMap(Map<String, String?> map) : super(map);

  String? get id => map["id"]?.toString();
}
