import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/sub_heading.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(

            child: Column(
              children: <Widget>[
                CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'assets/images/avatar.png',
                              ),
                            ),
                          ),
                          Subheading('Lector Codigo qr')
              ],
            ),
            decoration: BoxDecoration(
              color: LightColors.kDarkYellow,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Hogar'),
            subtitle: Text('Crear y lee tus Qr'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Leer Qr'),
            subtitle: Text('Lee tus qr'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Crear Qr'),
            subtitle: Text('Crea tus qr'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    ));
  }
}
