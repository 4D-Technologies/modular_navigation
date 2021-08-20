import 'package:example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class LoginPageParameters extends PageParameters {
  LoginPageParameters.fromMap(Map<String, String?> map) : super(map);
  LoginPageParameters(String redirectUrl) : super({"redirectUrl": redirectUrl});

  Uri get redirectUrl => Uri.parse(map["redirectUrl"].toString());
}

class LoginPage extends ModularPage<LoginPageParameters> {
  LoginPage(LoginPageParameters parameters) : super(parameters: parameters);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IconButton(
          onPressed: () {
            MyApp.loggedIn = true;
            context.navigateToUri(parameters.redirectUrl);
          },
          icon: Icon(Icons.login),
        ),
      ),
    );
  }
}
