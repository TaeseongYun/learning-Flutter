import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './page/my_root_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitUp,
  ]);
  runApp(MyRootPage());
}
