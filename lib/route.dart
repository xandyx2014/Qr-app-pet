import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/calendar_page.dart';
import 'screens/create_new_task_page.dart';
import 'screens/home_page.dart';

Map<String, WidgetBuilder> routeMain = {
  'home': (_) => HomePage(),
  'formulario-crear': (_) => CreateNewTaskPage(),
  'mostrar-datos': (_) => CalendarPage()
};