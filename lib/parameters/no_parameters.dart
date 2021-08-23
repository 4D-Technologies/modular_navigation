part of modular_navigation;

class NoPageParameters extends PageParameters {
  const NoPageParameters({Map<String, String?> map = const {}}) : super(map);

  @override
  operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NoPageParameters;
  }

  @override
  int get hashCode => 0;
}
