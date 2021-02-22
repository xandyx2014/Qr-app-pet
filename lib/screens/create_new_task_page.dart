import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_task_planner_app/provider/qr_provider.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/widgets/my_text_field.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class CreateNewTaskPage extends StatelessWidget {
  final _keyBoundary = new GlobalKey();

  void _captureImage() async {
    final RenderRepaintBoundary renderRepaintBoundary =
        _keyBoundary.currentContext.findRenderObject();
    final image = await renderRepaintBoundary.toImage();
    final bytes = await image.toByteData(format: ImageByteFormat.png);
    final bList = bytes.buffer.asUint8List();
    await Share.file('Qr generado', 'qr.png', bList, 'image/png',
        text: 'Qr generado');
  }

  @override
  Widget build(BuildContext context) {
    var qrDataProvider = Provider.of<QrDataProvider>(context);
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tu Mascota',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyTextField(
                        label: 'Nombre',
                        onChanged: (value) => qrDataProvider.miString = value,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              icon: downwardIcon,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: LightColors.kGreen,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'home');
                              },
                              icon: Icon(
                                Icons.calendar_today,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: MyTextField(
                        label: 'Start Time',
                        icon: downwardIcon,
                      )),
                      SizedBox(width: 40),
                      Expanded(
                        child: MyTextField(
                          label: 'End Time',
                          icon: downwardIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    label: 'Descripcion',
                    minLines: 3,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Categorias',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //direction: Axis.vertical,
                          alignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          runSpacing: 0,
                          //textDirection: TextDirection.rtl,
                          spacing: 10.0,
                          children: <Widget>[
                            Chip(
                              label: Text("GATO"),
                              backgroundColor: LightColors.kRed,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            Chip(
                              // onDeleted: () => print('perro'),
                              label: Text("PERRO"),
                            ),
                            Chip(
                              label: Text("CONEJO"),
                            ),
                            Chip(
                              label: Text("HAMSTER"),
                            ),
                            Chip(
                              label: Text("CUI"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RepaintBoundary(
                    key: _keyBoundary,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: QrImage(
                        data: qrDataProvider.miString ?? '',
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: width,
                    child: FlatButton(
                      onPressed: () => _captureImage(),
                      child: Container(
                        child: Text(
                          'Volver',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        width: width - 40,
                        decoration: BoxDecoration(
                          color: LightColors.kBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
