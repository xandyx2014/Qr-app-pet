import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/drawer_menu.dart';
import 'package:flutter_task_planner_app/widgets/sub_heading.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenu(),
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.menu,
                                color: LightColors.kDarkBlue, size: 30.0),
                            onPressed: () =>
                                _scaffoldKey.currentState.openDrawer())

                        /* Icon(Icons.search,
                            color: LightColors.kDarkBlue, size: 25.0), */
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Bienvenido a qr',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Dectector QR de Mascotas',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Subheading('Dectectar'),
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: LightColors.kGreen,
                                child: IconButton(
                                  onPressed: () {
                                    // scanner.scanPhoto().then((value) => print(value));
                                    BarcodeScanner.scan().then((value) {
                                      if (ResultType.Barcode == value.type) {
                                        // print(value.rawContent);

                                        try {
                                          final body =
                                              jsonDecode(value.rawContent);
                                          Navigator.pushNamed(
                                              context, 'mostrar-datos');
                                          print('JSon $body');
                                          // print(body['name']);
                                        } catch (e) {
                                          assert(e);
                                        }
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.photo_camera,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('formulario-crear');
                            },
                            child: TaskColumn(
                              icon: Icons.build,
                              iconBackgroundColor: LightColors.kRed,
                              title: 'Generar Qr',
                              subtitle: 'con datos dinamicos',
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.camera_alt,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'Leer Qr',
                            subtitle: 'subtitulo de la tarea',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: LightColors.kBlue,
                            title: 'Tarea 3',
                            subtitle: 'subtitulo de la tarea',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Subheading('Medida de avance'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kGreen,
                                loadingPercent: 0.25,
                                title: 'Medical App',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.6,
                                title: 'Making History Notes',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kDarkYellow,
                                loadingPercent: 0.45,
                                title: 'Sports App',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kBlue,
                                loadingPercent: 0.9,
                                title: 'Online Flutter Course',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
