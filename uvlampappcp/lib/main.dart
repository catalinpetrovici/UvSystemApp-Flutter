import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uvlampappcp/Screens/control_screen.dart';
import 'package:uvlampappcp/Screens/infocontrol_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        //systemNavigationBarColor: Colors.black,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ControlScreen.id,
      routes: {
        ControlScreen.id: (context) => ControlScreen(),
        infoControlScreen.id: (context) => infoControlScreen(),
        // LoginScreen.id: (context) => LoginScreen(),
        // RegistrationScreen.id: (context) => RegistrationScreen(),
        // ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
