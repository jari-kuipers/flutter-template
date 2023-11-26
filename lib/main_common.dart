import 'package:flutter/widgets.dart';
import 'package:hoegen_fietsverhuur/app.dart';
import 'package:hoegen_fietsverhuur/di.dart';

void start() {
  setupDi();
  runApp(const App());
}
