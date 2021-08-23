part of modular_navigation;

class IdPageParameters extends PageParameters {
  IdPageParameters.fromMap(Map<String, String?> map) : super(map);

  IdPageParameters(String id) : super({'id': id});

  String get id => map['id']!;
  set id(String value) => map['id'] = value;

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return (o is IdPageParameters && o.id == id) ||
        (o is OptionalIdPageParameters && o.id == id);
  }

  @override
  int get hashCode => id.hashCode;
}
