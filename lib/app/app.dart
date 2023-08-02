import 'package:flutter/material.dart';
import 'package:movie/presentation/resources/routes_manager.dart';
import 'package:movie/presentation/resources/theme_manager.dart';


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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.mainRoute,
      theme: getAppTheme(),
    );
  }
}