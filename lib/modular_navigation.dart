library modular_navigation;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'extensions/context.dart';
part 'extensions/navigatgor_key.dart';

part 'modules/base_module.dart';
part 'modules/root_module.dart';
part 'modules/sub_module.dart';

part 'pages/modular_page.dart';
part 'pages/noparameters_modular_page.dart';

part 'navigator/route_information_parser.dart';
part 'navigator/router_delegate.dart';

part 'navigator/modular_history.dart';
part 'navigator/modular_link.dart';

part 'parameters/page_parameters.dart';
part 'parameters/no_parameters.dart';
part 'parameters/id_page_parameters.dart';
part 'parameters/optional_id_page_parameters.dart';

part 'routes/noanimationpageroute.dart';
part 'routes/nopageparameters_route.dart';
part 'routes/base_modular_route.dart';
part 'routes/modular_route.dart';
part 'routes/id_route.dart';
part 'routes/optional_id_route.dart';

part 'exceptions/page_not_found.dart';
part 'exceptions/route_not_found.dart';

String combinePath(String rootPath, String path) {
  rootPath = rootPath.endsWith("/") || rootPath.endsWith("\\")
      ? rootPath.substring(0, rootPath.length - 1)
      : rootPath;
  rootPath = rootPath.replaceAll("\\", "/");
  path =
      path.startsWith("/") || path.startsWith("\\") ? path.substring(1) : path;
  path = path.endsWith("/") || path.endsWith("\\")
      ? path.substring(0, path.length - 1)
      : path;
  path = path.replaceAll("\\", "/");

  return rootPath + "/" + path;
}
