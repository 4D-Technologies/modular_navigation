part of modular_navigation;

class IdPageParameters extends PageParameters {
  IdPageParameters.fromMap(Map<String, String?> map) : super(map);

  IdPageParameters(String id) : super({'id': id});

  String get id => map['id']!;
  set id(String value) => map['id'] = value;
}
