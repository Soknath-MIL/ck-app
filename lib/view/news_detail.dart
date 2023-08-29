import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  dynamic news = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Container(
        //   color: Colors.amber,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    final parsedMap = jsonDecode(news['image'][0]);
                    return CachedNetworkImage(
                      imageUrl: parsedMap['url'],
                      progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  }),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${news['title']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${news['detail']}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  // SizedBox(height: 340),
                  // Text('test'),
                  // Container(
                  //   color: Colors.amber,
                  //   child: Builder(builder: (context) {
                  //     final url = jsonDecode(news['image'][0]);
                  //     return Text('image:  ${url['url']}');
                  //   }),
                  // )
                ],
              ),
              Positioned(
                left: 16.0,
                top: 16.0,
                child: Material(
                  color: AppColors.grayECECEC,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
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
      ),
      // ),
    );
  }
}
