import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final Map<String, dynamic> configMap;
  
  AppConfig({this.configMap});

  static Future<AppConfig> forEnvironment(String env) async {

    env = env ?? 'dev';
    final contents = await rootBundle.loadString('assets/config/$env.json');
    final json = jsonDecode(contents);

    return AppConfig(configMap: json);
  }
}