//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

import 'package:platform_device_id_web/platform_device_id_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:toast/toast_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  PlatformDeviceIdWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  ToastWebPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}