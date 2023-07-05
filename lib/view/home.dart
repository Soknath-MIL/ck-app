import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/components/buybox.dart';
import 'package:lottery/res/dimens.dart';
import 'package:lottery/res/images/logo.dart';
import 'package:lottery/view/history.dart';
import 'package:lottery/view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  // final int? activeTab;
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());
  bool isOpenDialog = false;
  FocusNode _lotteryInputNode = FocusNode();
  FocusNode _lotteryInputNodePrice = FocusNode();
  FocusNode _lotteryInputNodeDialog = FocusNode();
  FocusNode _lotteryInputNodePriceDialog = FocusNode();
  TextEditingController _lotteryInputControllerDialog = TextEditingController();
  TextEditingController _priceInputControllerDialog = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height -
                          AppDimension.buyboxHeigh -
                          AppDimension.bottomNavigationBar -
                          126,
                      child: ListView(
                        children: [
                          CarouselSlider(
                            items: [
                              AssetImage('images/banner1.png'),
                              AssetImage('images/banner2.png'),
                              AssetImage('images/banner3.png')
                            ].map((e) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(
                                //   color: Colors.amber,
                                // ),
                                child: Image(
                                  image: e,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 242.0,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayInterval: Duration(
                                seconds: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(Logo.ckGroup),
                                height: 30,
                              ),
                              Text(
                                'ງວດວັນທີ 12 - 05- 2023',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: AppColors.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ມື້',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '23',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ຊົ່ວໂມງ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '59',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ນາທີ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '59',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ວິນາທີ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // TabBar(tabs: _tabs)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  'images/news1.png',
                                ),
                              ),
                              Column(
                                children: [
                                  Image(
                                    image: AssetImage('images/news2.png'),
                                  ),
                                  Image(
                                    image: AssetImage('images/news3.png'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                    Container(
                      height: AppDimension.buyboxHeigh,
                      child: BuyBox(
                        lotteryInputNode: _lotteryInputNode,
                        lotteryInputNodePrice: _lotteryInputNodePrice,
                        onTapInput: () {
                          setState(() {
                            isOpenDialog = true;
                          });
                          _lotteryInputNode.unfocus();
                          _lotteryInputNodeDialog.requestFocus();
                        },
                        onTapInputPrice: () {
                          setState(() {
                            isOpenDialog = true;
                          });
                          _lotteryInputNodePrice.unfocus();
                          _lotteryInputNodePriceDialog.requestFocus();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (isOpenDialog)
            Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isOpenDialog = false;
                  });
                },
              ),
            ),
          if (isOpenDialog)
            Positioned(
              // height: AppDimension.buyboxHeigh,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.4,
                      // TODO: test this widget !! danger!!
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ເລກທີ່ເລືອກ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'ຈໍານວນເງິນ+โบนัส',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 12),
                                      width: 46,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          )),
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          highlightColor: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                            Colors.grey.shade300,
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                          onTap: () {
                                            print('object');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                padding: EdgeInsets.all(0),
                                itemCount: _homeViewModel.arrLottery.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.greyf1f0f0,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Flex(
                                      direction: Axis.horizontal,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Flex(
                                              direction: Axis.horizontal,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${_homeViewModel.arrLottery[index]['lottery']}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            // color: Colors.amber,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${_homeViewModel.arrLottery[index]['price']}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  child: IconButton(
                                                    // iconSize: 24,
                                                    color: Colors.white,
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.red),
                                                    ),
                                                    onPressed: () {
                                                      _homeViewModel
                                                          .removeLottery(index);
                                                    },
                                                    icon: Icon(Icons.close),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Obx(() => BuyBox(
                          totalPrice: _homeViewModel.arrLottery.fold(
                              0,
                              (previousValue, element) =>
                                  previousValue! +
                                  int.parse(element['price']!)),
                          lotteryInputNode: _lotteryInputNodeDialog,
                          lotteryInputNodePrice: _lotteryInputNodePriceDialog,
                          lotteryInputController: _lotteryInputControllerDialog,
                          priceInputController: _priceInputControllerDialog,
                          onChangeLottery: (value) {
                            _homeViewModel.onChangeLottery(value);
                          },
                          onChangePrice: (value) {
                            _homeViewModel.onChangePrice(value);
                          },
                          onTabAdd: () {
                            if (_homeViewModel.lottery.value != "" &&
                                _homeViewModel.price.value != "") {
                              _homeViewModel.appendLottery(
                                _homeViewModel.lottery.value,
                                _homeViewModel.price.value,
                              );
                              _homeViewModel.onChangeLottery("");
                              _homeViewModel.onChangePrice("");
                              _lotteryInputControllerDialog.clear();
                              _priceInputControllerDialog.clear();
                            }
                          },
                          onSubmit: () {
                            _homeViewModel.getArrLottery();
                            _homeViewModel.craeteTransaction();
                          },
                        )),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

// CarouselSlider(
//   options: CarouselOptions(height: 400.0),
//   items: [1,2,3,4,5].map((i) {
//     return Builder(
//       builder: (BuildContext context) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.symmetric(horizontal: 5.0),
//           decoration: BoxDecoration(
//             color: Colors.amber
//           ),
//           child: Text('text $i', style: TextStyle(fontSize: 16.0),)
//         );
//       },
//     );
//   }).toList(),
// )
