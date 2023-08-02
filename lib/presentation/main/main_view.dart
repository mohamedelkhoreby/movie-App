import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';
import 'pages/movie/view/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  @override
  MainViewState createState() => MainViewState();
}
class MainViewState extends State<MainView>{
    List<Widget> pages = [
    const HomePage(),
  ];
  List<String> titles = [
    AppStrings.homeTitle,
  ];
  var _title = AppStrings.homeTitle;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        shadowColor: ColorManager.lightGrey,
        elevation: 0.2,
        title: Text(_title, style: getBoldStyle(color: ColorManager.black)),
      ),
      body: Stack(
          children: <Widget>[
       pages[_currentIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: SizedBox(
              height: 60.0,
              child: BottomNavigationBar(
                backgroundColor: ColorManager.white.withOpacity(0.5),
                iconSize: 20.0,
                elevation: 0,
                selectedItemColor: ColorManager.black,
                unselectedItemColor: ColorManager.grey,
                currentIndex: _currentIndex,
                onTap: onTap,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: AppStrings.homeTitle),
                 
                ],
              ),
            ),
          ),
        ),
      ])
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}