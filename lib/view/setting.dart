import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view_models/setting_view_model.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final SettingViewModel _settingViewModel = Get.put(SettingViewModel());

  @override
  void initState() {
    _settingViewModel.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.purple,
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(242, 49, 55, 1),
                            Color.fromRGBO(0, 209, 255, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 44),
                            Obx(() => Text(
                                  '${_settingViewModel.name.value}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )),
                            SizedBox(height: 8),
                            Obx(() => Text(
                                  '${_settingViewModel.tel.value}',
                                  style: TextStyle(
                                    color: Color.fromRGBO(89, 89, 89, 1),
                                  ),
                                )),
                            SizedBox(height: 8),
                            Obx(() => Text(
                                  '${_settingViewModel.email.value}',
                                  style: TextStyle(
                                    color: Color.fromRGBO(89, 89, 89, 1),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: AppColors.primary,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(144),
                        ),
                      ),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 209, 255, 1),
                            Color.fromRGBO(255, 194, 36, 1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(144),
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  // highlightColor: AppColors.primaryHighlight,
                  overlayColor:
                      MaterialStateProperty.all(AppColors.primaryOverlay),
                  onTap: () {
                    print('test');
                    _settingViewModel.logout();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      // color: AppColors.primary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'inter',
                        color: Colors.white,
                      ),
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
}
