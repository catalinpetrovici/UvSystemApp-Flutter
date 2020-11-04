import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uvlampappcp/Screens/constants.dart';

class DataShowInfoScreen extends StatelessWidget {
  const DataShowInfoScreen({
    this.cardChild,
    this.cardChildren,
    this.columncrossaxisalignment,
    this.columnmainaxisalignment,
    this.rowcrossaxisalignment,
    this.rowmainaxisalignment,
    this.padding,
    this.contdecoration,
  });

  final Widget cardChild;
  final List<Widget> cardChildren;
  //final Widget cardChildren;
  final CrossAxisAlignment columncrossaxisalignment;
  final MainAxisAlignment columnmainaxisalignment;
  final CrossAxisAlignment rowcrossaxisalignment;
  final MainAxisAlignment rowmainaxisalignment;
  final EdgeInsetsGeometry padding;
  final Decoration contdecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: contdecoration,
        child: Row(
          crossAxisAlignment: rowcrossaxisalignment,
          mainAxisAlignment: rowmainaxisalignment,
          children: <Widget>[
            Container(
              child: Flexible(
                child: cardChild,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: columncrossaxisalignment,
                mainAxisAlignment: columnmainaxisalignment,
                children: cardChildren,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PercentIndicatorDataShowInfoScreen extends StatelessWidget {
  const PercentIndicatorDataShowInfoScreen(
      {this.stringicon,
      this.toptextindicator,
      this.midtextindicator,
      this.bottextindicator,
      this.percent});

  final IconData stringicon;
  final String toptextindicator;
  final String midtextindicator;
  final String bottextindicator;
  final double percent;

  @override
  Widget build(BuildContext context) {
    int _resizetext = 32;

    return DataShowInfoScreen(
      padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
      columnmainaxisalignment: MainAxisAlignment.start,
      columncrossaxisalignment: CrossAxisAlignment.start,
      rowmainaxisalignment: MainAxisAlignment.start,
      rowcrossaxisalignment: CrossAxisAlignment.center,
      contdecoration: infocontrolsec_boxdecoration,
      cardChild: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(
          stringicon,
          //Icons.lock_clock,
          color: Color(backgroundAppBarColor),
          size: MediaQuery.of(context).size.width * 0.13,
        ),
      ),
      cardChildren: <Widget>[
        Text(
          ' $toptextindicator',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / _resizetext,
              fontWeight: FontWeight.bold),
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.6,
          animation: true,
          lineHeight: 16.0,
          animationDuration: 2000,
          percent: percent,
          trailing: Text(
            ' $midtextindicator',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / _resizetext,
                fontWeight: FontWeight.bold),
          ),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Color(backgroundAppBarColor),
        ),
        Text(
          ' $bottextindicator',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / _resizetext,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ShortDataShowInfoScreen extends StatelessWidget {
  const ShortDataShowInfoScreen(
      {this.stringicon,
      this.toptextindicator,
      this.midtextindicator,
      this.bottextindicator,
      this.right,
      this.left});

  final IconData stringicon;
  final String toptextindicator;
  final String midtextindicator;
  final String bottextindicator;
  final double right;
  final double left;

  @override
  Widget build(BuildContext context) {
    int _resizetext = 32;

    return DataShowInfoScreen(
      padding: EdgeInsets.only(top: 10, right: right, left: left, bottom: 10),
      columnmainaxisalignment: MainAxisAlignment.start,
      columncrossaxisalignment: CrossAxisAlignment.start,
      rowmainaxisalignment: MainAxisAlignment.start,
      rowcrossaxisalignment: CrossAxisAlignment.center,
      contdecoration: infocontrolsec_boxdecoration,
      cardChild: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(
          stringicon,
          color: Color(backgroundAppBarColor),
          size: MediaQuery.of(context).size.width * 0.13,
        ),
      ),
      cardChildren: <Widget>[
        Text(
          '$toptextindicator',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / _resizetext,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '$midtextindicator',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / _resizetext,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '$bottextindicator',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / _resizetext,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
