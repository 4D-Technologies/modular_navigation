part of modular_navigation;

class OptionalIdPageParameters extends PageParameters {
  OptionalIdPageParameters([String? id]) : super({"id": id});

  OptionalIdPageParameters.fromMap(Map<String, String?> map) : super(map);

  String? get id => map["id"]?.toString();

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return (o is OptionalIdPageParameters && o.id == id) ||
        (o is IdPageParameters && o.id == id);
  }

  @override
  int get hashCode => id.hashCode;
}
