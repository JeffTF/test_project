
import 'package:flutter/material.dart';
import 'package:my_practice_project/screens/reserve_screen/history_tab.dart';
import 'package:my_practice_project/screens/reserve_screen/reserve_tab.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Reservation'),
            shadowColor: Colors.white,
            bottom: const TabBar(
              unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
                splashBorderRadius: BorderRadius.zero,
                tabs: [
                  Tab(
                    text: 'Reserve',
                  ),
                  Tab(
                    text: 'History',
                  )
                ]
            ),
          ),
          body: const TabBarView(
            children: [
              ReserveTab(),
              HistoryTab()
            ],
          ),
        ),
    );
  }
}
