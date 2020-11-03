import 'package:flutter/material.dart';
import 'package:uvlampappcp/Screens/constants.dart';

class ButonMid extends StatelessWidget {
  const ButonMid(
      {@required this.onPress, @required this.text, @required this.colour});

  final Function onPress;
  final Text text;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: colour,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textColor: Colors.white,
      disabledColor: colour,
      disabledTextColor: Color(0x00FFFFFF),
      splashColor: colour,
      onPressed: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextMid extends StatelessWidget {
  const TextMid({@required this.selectednumber, @required this.textmin});

  final String selectednumber;
  final String textmin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '$selectednumber',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '$textmin',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButonBot extends StatelessWidget {
  const ButonBot(
      {@required this.onPress, @required this.text, @required this.colour});

  final Function onPress;
  final Color colour;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: Border(
        top: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      color: colour,
      textColor: Colors.white,
      disabledColor: colour,
      disabledTextColor: Color(0x00FFFFFF),
      splashColor: Color(0x00FFFFFF),
      onPressed: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(45);

  const CustomAppBar(
      {this.lefticon,
      this.leftontap,
      @required this.text,
      this.righticon,
      this.rightontap});

  final Icon lefticon;
  final Function leftontap;
  final String text;
  final Icon righticon;
  final Function rightontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(backgroundAppBarColor),
      title: Center(
        child: Text('$text'),
      ),
      leading: GestureDetector(
        child: lefticon,
        onTap: leftontap,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: rightontap,
            child: righticon,
          ),
        ),
      ],
      actionsIconTheme: IconThemeData(size: 30),
    );
  }
}
