part of modular_navigation;

abstract class NoParametersModularPage extends ModularPage<NoPageParameters> {
  NoParametersModularPage({
    Animation? animation,
  }) : super(
          parameters: NoPageParameters(),
          animation: animation,
        );
}
