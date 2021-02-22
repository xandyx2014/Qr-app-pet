import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';


class MyBackButton extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => Navigator.pushNamed(context, 'home'),
                      icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: LightColors.kDarkBlue,
            ),
          ),
        )
    );
  }
}