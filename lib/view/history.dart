import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              tabs: [
                Tab(
                  child: Text('ประวัติการซื้อ'),
                ),
                Tab(
                  child: Text('ประวัติการถูก'),
                )
              ],
            ),
          )),
    );
  }
}
