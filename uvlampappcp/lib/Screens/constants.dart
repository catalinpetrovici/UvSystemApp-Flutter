import 'package:flutter/material.dart';

const backgroundAppColor = 0xFF3AB2EE, backgroundAppBarColor = 0xFF3D3CB1;

const infocontrol_boxdecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(0, 1), // changes position of shadow
    ),
  ],
  color: Color(backgroundAppBarColor),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

const infocontrolsec_boxdecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(0, 1), // changes position of shadow
    ),
  ],
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);
