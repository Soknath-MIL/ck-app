import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view/history.dart';
import 'package:lottery/view/home.dart';
import 'package:lottery/view/testSticky.dart';
import 'package:lottery/view/testdialog.dart';

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
    TestDialog(),
    TestSticky(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: ClipRect(
          child: Container(
            padding: EdgeInsets.all(0),
            height: 80,
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
              useLegacyColorScheme: false,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: AppColors.primary,
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
                  // backgroundColor: Colors.amber,
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.primary,
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
                BottomNavigationBarItem(
                  backgroundColor: AppColors.primary,
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
                          'history3',
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
                          'history3',
                        ),
                      ],
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.primary,
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
                          'history4',
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
                          'history4',
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
