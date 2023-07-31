import 'package:flutter/material.dart';

class App extends StatefulWidget{
 //name const
  const App.internal({super.key});
  final int appState = 0;
  //singleton or single instance
  static  const App _instance = App.internal();
  //factory
  factory App() => _instance;
  @override
  AppState createState() => AppState();
}
class AppState extends State<App>{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}