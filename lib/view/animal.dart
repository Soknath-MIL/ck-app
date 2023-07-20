import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  final animalDatas = [
    {
      "name": "ตัวนิ่ม",
      "image": "armadillo.png",
      "lotteries": ["43", "54", "15"],
    },
    {
      "name": "ผึ้ง",
      "image": "bee.png",
      "lotteries": ["43", "54", "15"],
    },
    {
      "name": "ปลาใหญ่",
      "image": "bigfish.png",
      "lotteries": ["93", "51", "25"],
    },
    {
      "name": "งูใหญ่",
      "image": "bigsnake.png",
      "lotteries": ["93", "51", "25"],
    },
    {
      "name": "นกแกนแก",
      "image": "birdgangare.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ควาย",
      "image": "buffalo.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ผีเสื้อ",
      "image": "butterfly.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "แมว",
      "image": "cat.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "แมวป่า",
      "image": "catforest.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ตะขาบ",
      "image": "centipede.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ไก่",
      "image": "chicken.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ปู",
      "image": "crab.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "กวาง",
      "image": "deer.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "หมา",
      "image": "dog.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "อินทรีย์",
      "image": "eagle.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "นกกระยาง",
      "image": "egret.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ช้าง",
      "image": "elephant.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ปลา",
      "image": "fish.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "กบ",
      "image": "fog.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "แพะ",
      "image": "goat.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ห่าน",
      "image": "goose.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "เหยี่ยว",
      "image": "hawk.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ม้า",
      "image": "horse.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "สิงโต",
      "image": "lion.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "ลิง",
      "image": "monkey.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "นาก",
      "image": "otter.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "นกยู",
      "image": "peacock.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "หมู",
      "image": "pig.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "เม่น",
      "image": "porcupine.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "กระต่าย",
      "image": "rabbit.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "หนู",
      "image": "rat.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "แมวน้ำ",
      "image": "seal.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "หอย",
      "image": "shell.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "กุ้ง",
      "image": "shrimp.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "งู",
      "image": "snake.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "แมงมุม",
      "image": "spiderman.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "นกนางแอ่น",
      "image": "swallow.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "เสือ",
      "image": "tiger.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "เต่า",
      "image": "turtle.png",
      "lotteries": ["92", "51", "21"],
    },
    {
      "name": "อีเห็น",
      "image": "weasel.png",
      "lotteries": ["92", "51", "21"],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Center(
          child: Text(
            'ตำราสัตว์',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Material(
            borderRadius: BorderRadius.circular(32),
            color: Colors.red,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              overlayColor: MaterialStateProperty.all<Color>(
                Colors.red.shade700,
              ),
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: 32,
                height: 32,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            color: AppColors.greyf1f0f0,
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.6,
            child: Wrap(
              spacing: 8,
              runSpacing: 10,
              direction: Axis.horizontal,
              children: animalDatas.map((animal) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.5 - 4 - 10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage(
                                'images/animalphoto/${animal['image']}'),
                            height: 48,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${animal['name']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: (animal['lotteries'] as List<String>)
                            .map((lottery) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              '$lottery',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 8),
                      Material(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(0, 117, 255, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 6),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'ซื้อ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList()
              // Container(
              //   color: Colors.lime,
              //   child: Text('data'),
              //   width: MediaQuery.of(context).size.width * 0.5 - 6 - 10,
              // ),
              // Container(
              //   color: Colors.amber,
              //   child: Text('data'),
              //   width: MediaQuery.of(context).size.width * 0.5 - 6 - 10,
              // ),
              // Container(
              //   color: Colors.amber,
              //   child: Text('data'),
              //   width: MediaQuery.of(context).size.width * 0.5 - 6 - 10,
              // ),
              ,
            ),
          ),
        ),
      ),
    );
  }
}
