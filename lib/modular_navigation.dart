library modular_navigation;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'extensions/context.dart';
part 'extensions/navigatgor_key.dart';

part 'modules/base_module.dart';
part 'modules/root_module.dart';
part 'modules/sub_module.dart';

part 'navigator/modular_page.dart';
part 'navigator/route_information_parser.dart';
part 'navigator/router_delegate.dart';
part 'navigator/modular_route.dart';
part 'navigator/modular_history.dart';

part 'parameters/page_parameters.dart';
part 'parameters/no_parameters.dart';
part 'parameters/id_page_parameters.dart';

part 'routes/noanimationpageroute.dart';

part 'exceptions/page_not_found.dart';
part 'exceptions/route_not_found.dart';
