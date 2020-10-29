import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:uvlampappcp/Screens/infocontrol_screen.dart';
import 'package:uvlampappcp/components/cpn_control_screen.dart';
import 'package:uvlampappcp/Screens/constants.dart';

class ControlScreen extends StatefulWidget {
  static const String id = 'control_screen';
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(backgroundAppColor),
          appBar: CustomAppBar(
            text: 'Sistem UV',
            LeftIcon: Icon(Icons.arrow_back_ios),
            LeftOnTap: () {},
            RightIcon: Icon(Icons.info),
            RightOnTap: () {
              Navigator.pushNamed(context, infoControlScreen.id);
            },
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(backgroundAppBarColor),
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset('images/UVDec1.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                _visibilityTag
                    ? new Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ButonMid(
                                onPress: !_stbtnbotmid1
                                    ? null
                                    : () {
                                        setState(() {
                                          _stbtnbotmid1 = false;
                                          subtract();
                                          Timer(
                                              Duration(milliseconds: 500),
                                              () => setState(
                                                  () => _stbtnbotmid1 = true));
                                        });
                                      },
                                text: Text(
                                  subtracttext,
                                ),
                                colour: Color(backgroundAppColor),
                              ),
                            ),
                            TextMid(
                                selectednumber: '$selectednumber',
                                textmin: '$textmin'),
                            Expanded(
                              child: ButonMid(
                                onPress: !_stbtnbotmid2
                                    ? null
                                    : () {
                                        setState(() {
                                          _stbtnbotmid2 = false;
                                          add();
                                          Timer(
                                              Duration(milliseconds: 500),
                                              () => setState(
                                                  () => _stbtnbotmid2 = true));
                                        });
                                      },
                                text: Text(
                                  addtext,
                                ),
                                colour: Color(backgroundAppColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    : new Container(),
                Expanded(
                  flex: _visibilityTag ? 1 : 2,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        _timetodisplay,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ButonBot(
                    onPress: !_stbtnbot
                        ? null
                        : () {
                            setState(() {
                              functieButonBot();
                            });
                          },
                    text: Text(
                      _selectedPressed == Pressed.START ? 'START' : 'STOP',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    colour: _selectedPressed == Pressed.START
                        ? Color(0xFF39743E)
                        : Color(0xFFCD0505),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  Pressed _selectedPressed = Pressed.START;
  StateClock _statecl = StateClock.ENABLE;
  bool _stbtnbot = true,
      _stbtnbotmid1 = true,
      _stbtnbotmid2 = true,
      _visibilityTag = true;
  //
  int selectednumber = 7, _min = 0, _sec = 0, numberclock = 420;
  String _timetodisplay = '00:00';

  static const String addtext = '+', subtracttext = '-', textmin = 'min';
  //
  //
  void _changed(bool visibility, String field) {
    setState(() {
      field == 'tag' ? _visibilityTag = visibility : print('');
    });
  }

  //
  void playSound() {
    final player = AudioCache();
    player.play('note1.wav');
  }

  //
  void startcount() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(
        () {
          if (numberclock >= 1 && _statecl == StateClock.ENABLE) {
            numberclock = numberclock - 1;
          } else if (numberclock < 1 && _statecl == StateClock.ENABLE) {
            t.cancel();
            playSound();
            _visibilityTag ? print('') : _changed(true, "tag");
            _statecl = StateClock.DISABLE;
            _selectedPressed = Pressed.START;
          } else if (_statecl == StateClock.DISABLE) {
            t.cancel();
            _selectedPressed = Pressed.START;
          }
          _min = numberclock ~/ 60;
          _sec = numberclock - (60 * _min);
          _timetodisplay = _min.toString().padLeft(2, '0') +
              ':' +
              _sec.toString().padLeft(2, '0');
        },
      );
    });
  }

  //
  void stopcount() {
    _statecl = StateClock.DISABLE;
    _visibilityTag ? print('') : _changed(true, "tag");
  }

  //
  void add() {
    selectednumber >= 15 ? selectednumber = 15 : selectednumber += 1;
    resetClock(selectednumber);
  }

  //
  void subtract() {
    selectednumber <= 1 ? selectednumber = 1 : selectednumber -= 1;
    resetClock(selectednumber);
  }

  //
  int resetClock(int selectednumber) {
    _sec = 0;
    numberclock = ((selectednumber * 60) + _sec);
    return numberclock;
  }

  //
  void functieButonBot() {
    if (_selectedPressed == Pressed.START) {
      _visibilityTag ? _changed(false, "tag") : print('');
      _statecl = StateClock.ENABLE;
      startcount();
      _selectedPressed = Pressed.STOP;
    } else if (_selectedPressed == Pressed.STOP) {
      _visibilityTag ? print('') : _changed(false, "tag");
      stopcount();
      _selectedPressed = Pressed.START;
    }
    _stbtnbot = false;
    Timer(Duration(milliseconds: 500), () => setState(() => _stbtnbot = true));
  }
}

enum Pressed {
  START,
  STOP,
}
enum StateBtn {
  ENABLE,
  DISABLE,
}

enum StateClock {
  ENABLE,
  DISABLE,
}
