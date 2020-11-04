import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uvlampappcp/Screens/constants.dart';
import 'package:uvlampappcp/components/cpn_control_screen.dart';
import 'package:uvlampappcp/components/cpn_infocontrol_screen.dart';

class InfoControlScreen extends StatefulWidget {
  static const String id = 'infocontrol_screen';
  @override
  _InfoControlScreenState createState() => _InfoControlScreenState();
}

class _InfoControlScreenState extends State<InfoControlScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          //backgroundColor: Color(backgroundAppColor),
          appBar: CustomAppBar(
            text: 'Sistem UV',
            lefticon: Icon(Icons.arrow_back_ios),
            leftontap: () {
              Navigator.pop(context);
            },
            righticon: Icon(Icons.refresh),
            rightontap: () {
              Navigator.pop(context);
            },
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  DataShowInfoScreen(
                    padding: EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 10),
                    columnmainaxisalignment: MainAxisAlignment.center,
                    columncrossaxisalignment: CrossAxisAlignment.end,
                    rowmainaxisalignment: MainAxisAlignment.center,
                    rowcrossaxisalignment: CrossAxisAlignment.center,
                    contdecoration: infocontrol_boxdecoration,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset('images/UVIcon.png'),
                    ),
                    cardChildren: <Widget>[
                      Text(
                        'Ultima sincronizare:',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '27-10-2020',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '10:23 AM',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  PercentIndicatorDataShowInfoScreen(
                    stringicon: Icons.lightbulb_outline,
                    toptextindicator: 'Timpul de funcționare a lămpilor',
                    midtextindicator: 'min',
                    bottextindicator: '6.000/10.000',
                    percent: 0.6,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: ShortDataShowInfoScreen(
                        right: 5,
                        left: 20,
                        stringicon: Icons.person,
                        toptextindicator: 'Număr',
                        midtextindicator: 'Accesari :',
                        bottextindicator: '263',
                      ),
                    ),
                    Expanded(
                      child: ShortDataShowInfoScreen(
                        right: 20,
                        left: 5,
                        stringicon: Icons.refresh_rounded,
                        toptextindicator: 'Număr',
                        midtextindicator: 'Sincronizări :',
                        bottextindicator: '255',
                      ),
                    )
                  ]),
                  PercentIndicatorDataShowInfoScreen(
                    stringicon: Icons.healing_sharp,
                    toptextindicator: 'Condiție sistem',
                    midtextindicator: '%',
                    bottextindicator: '90/100',
                    percent: 0.9,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: ShortDataShowInfoScreen(
                        right: 5,
                        left: 20,
                        stringicon: Icons.remove_red_eye_outlined,
                        toptextindicator: 'Număr',
                        midtextindicator: 'detectare PIR :',
                        bottextindicator: '24',
                      ),
                    ),
                    Expanded(
                      child: ShortDataShowInfoScreen(
                        right: 20,
                        left: 5,
                        stringicon: Icons.stop_circle_outlined,
                        toptextindicator: 'Număr apăsări',
                        midtextindicator: 'Buton urgență :',
                        bottextindicator: '35',
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
