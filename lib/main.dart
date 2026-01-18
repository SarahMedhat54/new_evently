import 'package:evently_c17/ui/screens/add_event/add_event_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    buildImage();
    return MaterialApp(home: AddEventScreen());
  }

  Widget buildImage(){
    context;
    return Container();
  }
}
