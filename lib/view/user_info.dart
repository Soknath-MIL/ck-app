import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final name = Get.arguments[0];
  final email = Get.arguments[1];
  final tel = Get.arguments[2];
  String avatar = Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 12),
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
                        child: Builder(builder: (context) {
                          if (avatar == '') {
                            return Icon(
                              Icons.person,
                              size: 80,
                              color: AppColors.primary,
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: CachedNetworkImage(
                                imageUrl: avatar,
                                progressIndicatorBuilder: (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  size: 80,
                                ),
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(218, 218, 218, 1),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      '$name',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(218, 218, 218, 1),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      '$email',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(218, 218, 218, 1),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      '$tel',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(218, 218, 218, 1),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'เปลี่ยนรหัสผ่าน',
                          style: TextStyle(fontSize: 16),
                        ),
                        SvgPicture.asset('images/arrowcircleright.svg'),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(218, 218, 218, 1),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'แจ้งลบบัญชี',
                          style: TextStyle(fontSize: 16),
                        ),
                        SvgPicture.asset('images/arrowcircleright.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              child: Material(
                color: AppColors.grayECECEC,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
