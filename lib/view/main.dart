import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view/history.dart';
import 'package:lottery/view/home.dart';
import 'package:lottery/view/lottery_history.dart';
import 'package:lottery/view/notification.dart';
import 'package:lottery/view/setting.dart';
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
    LotteryHistoryPage(),
    NotificationPage(),
    SettingPage(),
    // TestDialog(),
    // TestSticky(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 74,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Material(
                  color: currentIndex == 0 ? Colors.white : AppColors.primary,
                  borderRadius: BorderRadius.circular(60),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.home,
                        //   color: AppColors.primary,
                        // ),
                        SvgPicture.asset(
                          'images/home.svg',
                          semanticsLabel: 'SVG label',
                          colorFilter: ColorFilter.mode(
                            currentIndex == 0
                                ? AppColors.primary
                                : Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          'ໜ້າຫຼັກ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: currentIndex == 0
                                ? AppColors.primary
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.circular(60),
                    ),
                child: Material(
                  color: currentIndex == 1 ? Colors.white : AppColors.primary,
                  borderRadius: BorderRadius.circular(60),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.history,
                        //   color: AppColors.primary,
                        // ),
                        SvgPicture.asset(
                          'images/history.svg',
                          semanticsLabel: 'SVG label',
                          colorFilter: ColorFilter.mode(
                            currentIndex == 1
                                ? AppColors.primary
                                : Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          'ประวัติซื้อ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: currentIndex == 1
                                ? AppColors.primary
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.circular(60),
                    ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/lottery_history.svg',
                          semanticsLabel: 'SVG label',
                          colorFilter: ColorFilter.mode(
                              AppColors.primary, BlendMode.srcIn),
                        ),
                        Text(
                          'ประวัติซื้อ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.circular(60),
                    ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notification_add,
                          color: AppColors.primary,
                        ),
                        Text(
                          'แจ้งเตือน',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.circular(60),
                    ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      setState(() {
                        currentIndex = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/setting.svg',
                          semanticsLabel: 'SVG label',
                          colorFilter: ColorFilter.mode(
                              AppColors.primary, BlendMode.srcIn),
                        ),
                        Text(
                          'ตั้งค่า',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

/**
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(0),
          height: 80,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            // gradient: LinearGradient(
            //   colors: [Colors.black, Colors.amber],
            // ),
            color: AppColors.primary,
            // color: Colors.amber,
          ),
          child: ClipRect(
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
                  // backgroundColor: AppColors.primary,
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
                  // backgroundColor: AppColors.primary,
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
                  // backgroundColor: AppColors.primary,
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
   */
}
