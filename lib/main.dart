import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chkbmap/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(380, 180);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.bottomRight;

    final currentPosition = appWindow.position;
    appWindow.position =
        Offset(currentPosition.dx - 40, currentPosition.dy - 40);

    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // Set background color to black
      ),
      home: const HomeScreen(),
    );
  }
}
