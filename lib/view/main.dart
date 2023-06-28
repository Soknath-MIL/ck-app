import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view/history.dart';
import 'package:lottery/view/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeView(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: ClipRect(
          child: Container(
            padding: EdgeInsets.all(0),
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              // gradient: LinearGradient(
              //   colors: [Colors.black, Colors.amber],
              // ),
              color: AppColors.primary,
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              fixedColor: Colors.black,
              backgroundColor: Colors.transparent,
              // selectedIconTheme: IconThemeData(
              //   color: Colors.amber,
              //   grade: 10,
              // ),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        Text(
                          'home',
                        ),
                      ],
                    ),
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        Text(
                          'home',
                        ),
                      ],
                    ),
                  ),
                  label: '',
                  backgroundColor: Colors.amber,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.history,
                        ),
                        Text(
                          'history',
                        ),
                      ],
                    ),
                  ),
                  label: '',
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.history,
                        ),
                        Text(
                          'history',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              currentIndex: currentIndex,
              onTap: (value) {
                print('value 146: $value');
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
