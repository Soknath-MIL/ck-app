import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottery/main.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/routes/routes_name.dart';
import 'package:lottery/view_models/setting_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                child: Column(
                  children: [
                    Container(
                      // color: Colors.purple,
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              RouteName.user_info,
                              arguments: [
                                _settingViewModel.name,
                                _settingViewModel.email,
                                _settingViewModel.tel,
                              ],
                            );
                          },
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
                                              color:
                                                  Color.fromRGBO(89, 89, 89, 1),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      Obx(() => Text(
                                            '${_settingViewModel.email.value}',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(89, 89, 89, 1),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(144),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: 80,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Material(
                      color: AppColors.blueeffcff,
                      borderRadius: BorderRadius.circular(6),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6),
                        overlayColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(190, 238, 249, 1),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, -2),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(40),
                                width: MediaQuery.of(context).size.width,
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .changeLanguageTitle,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(89, 89, 89, 1),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  MyApp.setLocale(
                                                    context,
                                                    Locale('lo'),
                                                  );
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/laos.png"),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Text('ภาษาลาว'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  MyApp.setLocale(
                                                    context,
                                                    Locale('th'),
                                                  );
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/Th.png"),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Text('ภาษาไทย'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  MyApp.setLocale(
                                                    context,
                                                    Locale('en'),
                                                  );
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/US.png"),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Text('ภาษาอังกฤษ'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 54,
                                height: 54,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(0, 209, 255, 1),
                                      Color.fromRGBO(255, 194, 36, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(54),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width,
                                  child:
                                      SvgPicture.asset('images/translate.svg'),
                                ),
                              ),
                              SizedBox(width: 14),
                              Text(AppLocalizations.of(context).changeLanguage),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.blueeffcff,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 209, 255, 1),
                                  Color.fromRGBO(255, 194, 36, 1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(54),
                              ),
                              padding: EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width,
                              child: SvgPicture.asset('images/likeshapes.svg'),
                            ),
                          ),
                          SizedBox(width: 14),
                          Text('แนะนำให้บริการ'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.blueeffcff,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 209, 255, 1),
                                  Color.fromRGBO(255, 194, 36, 1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(54),
                              ),
                              padding: EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width,
                              child: SvgPicture.asset('images/people.svg'),
                            ),
                          ),
                          SizedBox(width: 14),
                          Text('แนะนำเพื่อน'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.blueeffcff,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 209, 255, 1),
                                  Color.fromRGBO(255, 194, 36, 1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(54),
                              ),
                              padding: EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width,
                              child: SvgPicture.asset('images/medalstar.svg'),
                            ),
                          ),
                          SizedBox(width: 14),
                          Text('คะแนนของฉัน'),
                        ],
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
                    height: 68,
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
