part of modular_navigation;

abstract class NoParametersModularPage extends ModularPage<NoPageParameters> {
  NoParametersModularPage({
    Animation<dynamic>? animation,
  }) : super(
          parameters: NoPageParameters(),
          animation: animation,
        );
}
