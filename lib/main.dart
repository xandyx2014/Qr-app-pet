import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/provider/qr_provider.dart';
import 'package:flutter_task_planner_app/route.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // debugPaintSizeEnabled = true;
    // debugPaintPointersEnabled = true;
    // debugPaintLayerBordersEnabled = true;
    // debugPaintBaselinesEnabled = true;
    return MultiProvider(
      providers: [Provider(create: (_) => QrDataProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: LightColors.kLightYellow,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: LightColors.kDarkBlue,
                displayColor: LightColors.kDarkBlue,
                fontFamily: 'Poppins',
              ),
        ),
        initialRoute: 'home',
        routes: routeMain,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
