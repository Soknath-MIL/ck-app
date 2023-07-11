import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/components/buybox.dart';
import 'package:lottery/res/dimens.dart';
import 'package:lottery/res/images/logo.dart';
import 'package:lottery/view/buy_confirm.dart';
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
  bool isOpenRemoveAll = false;
  bool isOpenBuyConfirm = false;
  bool isOpenBill = false;
  FocusNode _lotteryInputNode = FocusNode();
  FocusNode _lotteryInputNodePrice = FocusNode();
  FocusNode _lotteryInputNodeDialog = FocusNode();
  FocusNode _lotteryInputNodePriceDialog = FocusNode();
  TextEditingController _lotteryInputController = TextEditingController();
  TextEditingController _priceInputController = TextEditingController();
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  SizedBox(height: 10),
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
                        totalPrice: _homeViewModel.arrLottery.fold(
                            0,
                            (previousValue, element) =>
                                previousValue! + int.parse(element['price']!)),
                        lotteryInputNode: _lotteryInputNode,
                        lotteryInputNodePrice: _lotteryInputNodePrice,
                        lotteryInputController: _lotteryInputController,
                        priceInputController: _priceInputController,
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
                        onSubmit: () {
                          setState(() {
                            isOpenBuyConfirm = true;
                          });
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
                    Obx(
                      () => Visibility(
                        visible: _homeViewModel.arrLottery.isNotEmpty,
                        child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: InkWell(
                                              highlightColor:
                                                  Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                Colors.grey.shade300,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              ),
                                              onTap: () {
                                                print('object');
                                                setState(() {
                                                  isOpenRemoveAll = true;
                                                });
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
                                child: ListView.builder(
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
                                                    margin: EdgeInsets.only(
                                                        left: 12),
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
                                                            .removeLottery(
                                                                index);
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
                            ],
                          ),
                        ),
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
                            _lotteryInputController.text = value;
                          },
                          onChangePrice: (value) {
                            _homeViewModel.onChangePrice(value);
                            _priceInputController.text = value;
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
                              _lotteryInputController.clear();
                              _priceInputController.clear();
                            } else {
                              // Get.
                              print('test');
                              final message = 'Please enter lottery or price';
                              Get.snackbar(
                                'Warning!',
                                message,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.amber.shade100,
                                // colorText: d
                              );
                              _lotteryInputNodeDialog.highlightMode;
                            }
                          },
                          onSubmit: () {
                            // _homeViewModel.getArrLottery();
                            setState(() {
                              isOpenBuyConfirm = true;
                            });
                            _lotteryInputNodeDialog.unfocus();
                            _lotteryInputNodePriceDialog.unfocus();
                          },
                        )),
                  ],
                ),
              ),
            ),
          if (isOpenRemoveAll)
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
          if (isOpenRemoveAll)
            Center(
              child: IntrinsicHeight(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Text('remove all lottery?'),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isOpenRemoveAll = false;
                              });
                            },
                            child: Text('cancel'),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.red.shade600,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isOpenRemoveAll = false;
                                _homeViewModel.removeAllLottery();
                              });
                            },
                            child: Text(
                              'remove',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (isOpenBuyConfirm)
            Obx(() => BuyConfirm(
                  totalPrice: _homeViewModel.arrLottery.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + int.parse(element['price']!)),
                  onTap: () {
                    final response = _homeViewModel.craeteTransaction();
                    response.then((value) {
                      if (value) {
                        setState(() {
                          isOpenBuyConfirm = false;
                          isOpenDialog = false;
                          isOpenBill = true;
                        });
                        _lotteryInputNodeDialog.unfocus();
                        _lotteryInputNodePriceDialog.unfocus();
                      } else {
                        Get.snackbar('Failed', 'something went wrong');
                      }
                    });
                  },
                  onBack: () {
                    setState(() {
                      isOpenBuyConfirm = false;
                      isOpenDialog = true;
                    });
                    _lotteryInputNode.unfocus();
                    _lotteryInputNodeDialog.requestFocus();
                  },
                )),
          if (isOpenBill)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black54,
            ),
          if (isOpenBill)
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(4),
                      // width: 24,
                      // height: 24,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isOpenBill = false;
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'ກະຊວງການເງິນ ຫວຍພັດທະນາ ຈັດຈໍາໜ່າຍໂດຍ CK GROUP',
                      ),
                    ),
                    Center(
                      child: Container(
                        color: AppColors.greyd9d9d9,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                    Center(
                      child: Image(
                        image: AssetImage(
                          Logo.main,
                        ),
                        width: 112,
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Image(
                        image: AssetImage(Logo.ckGroup),
                        height: 40,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ຊື່ຜູ້ຊື້: Sarayut Settabodee',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                            ),
                          ),
                          Text(
                            'ວັນທີ 12/05/2023',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ໂທລະສັບ: 0865446524',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                            ),
                          ),
                          Text(
                            'ເວລາຊື້ 14:02:39',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        'ງວດ: 230512  ງວດວັນທີี่ 12/05/2023',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.86,
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เลขที่ซื้อ'),
                          Text('จำนวนเงิน'),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.86,
                        color: Colors.amber,
                      ),
                    ),
                    ..._homeViewModel.arrLottery.map(
                      (e) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${e['lottery']}'),
                              Text('${e['price']}'),
                            ],
                          ),
                        );
                      },
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('2440'),
                    //       Text('1,100'),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 8),
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('290'),
                    //       Text('2,100'),
                    //     ],
                    //   ),
                    // ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 5,
                        width: MediaQuery.of(context).size.width * 0.86,
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('ລວມເງິນ'),
                          SizedBox(width: 8),
                          Text(
                            '${_homeViewModel.arrLottery.fold(0, (previousValue, element) => previousValue + int.parse(element['price']!))}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('ເລກທີບິນຫວຍ: 20230512000000001234'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('ຊໍາລະໂດຍ: LDB Trust'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('ຕິດຕໍ່ CK GROUP: 0865446524'),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
