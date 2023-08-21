import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/routes/routes_name.dart';
import 'package:lottery/view_models/notification_view_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationViewModel _notificationViewModel = Get.put(NotificationViewModel());
  final notifications = [
    {
      'icon': Image(image: AssetImage('images/ck-w-noti.png')),
      'header': 'ยินดีต้อนรับสู่การสนทนาเกี่ยวกับหวย!',
      'content': 'โปรดระบุหวยที่คุณสนใจและข้อมูลที่คุณต้องการทราบเพิ่มเติมเกี่ยวกับหวยนั้น ขอบคุณครับ!',
    },
    {
      'icon': Text(
        '10%',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      'header': 'โปรโมชั่น',
      'content': 'โปรดระบุหวยที่คุณสนใจและข้อมูลที่คุณต้องการทราบเพิ่มเติมเกี่ยวกับหวยนั้น ขอบคุณครับ!',
    },
    {
      'icon': SvgPicture.asset(
        'images/cup.svg',
        semanticsLabel: 'SVG label',
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      'header': 'ยินดีด้วยคุณถูกรางวัล',
      'content': 'โปรดระบุหวยที่คุณสนใจและข้อมูลที่คุณต้องการทราบเพิ่มเติมเกี่ยวกับหวยนั้น ขอบคุณครับ!',
    },
  ];

  String parseDateTime(String datetime) {
    final parsedDatetime = DateTime.parse(datetime);
    return "${parsedDatetime.day.toString().padLeft(2, '0')}/${parsedDatetime.month.toString().padLeft(2, '0')}/${parsedDatetime.year}";
  }

  @override
  void initState() {
    print('initState 48');
    _notificationViewModel.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      print('object $index');
                      Get.toNamed(
                        RouteName.news_detail,
                        arguments: [
                          _notificationViewModel.newsList[index],
                        ],
                      );
                    },
                    child: Container(
                      // margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      // width: MediaQuery.of(context).size.width * 0.2,
                      width: 120,
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppColors.yellowGradient,
                                  AppColors.redGradient,
                                ],
                              ),
                            ),
                            child: Center(
                              child: notifications[index]['icon'] as Widget,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // '${notifications[index]['header']}',
                                    '${_notificationViewModel.newsList[index]['title']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    // '${notifications[index]['content']}',
                                    '${_notificationViewModel.newsList[index]['detail']}',
                                    // 's',
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        // '12/05/2023',
                                        "${parseDateTime(_notificationViewModel.newsList[index]["\$createdAt"])}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 117, 255, 1),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: _notificationViewModel.newsList.length,
          ),
        ),
      ),
    );
  }
}
