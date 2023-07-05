import 'package:flutter/material.dart';
import 'package:lottery/res/dimens.dart';

class TestSticky extends StatefulWidget {
  const TestSticky({super.key});

  @override
  State<TestSticky> createState() => _TestStickyState();
}

class _TestStickyState extends State<TestSticky> {
  bool isBackdropVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backdrop Example'),
      ),
      body: Stack(
        children: [
          // Backdrop container
          Container(
            color: Colors.amber,
            child: Text(
              'asda',
              style: TextStyle(fontSize: 30),
            ),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          if (isBackdropVisible)
            Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isBackdropVisible = false;
                  });
                },
              ),
            ),
          // Content container
          Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: ElevatedButton(
                child: Text('Show Backdrop'),
                onPressed: () {
                  setState(() {
                    isBackdropVisible = !isBackdropVisible;
                  });
                },
              ),
            ),
          ),

          // Container with higher z-index
          if (isBackdropVisible)
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Container with higher z-index',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
