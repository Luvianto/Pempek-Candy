import 'package:flutter/material.dart';
import 'package:pempek_candy/screens/branch_screen.dart';
import 'package:pempek_candy/screens/home_screen.dart';
import 'package:pempek_candy/screens/profile.dart';

class TabBarHome extends StatelessWidget {
  const TabBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text(
            'PEMPEK CANDY',
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            BranchScreen(),
            Profile(),
          ],
        ),
        bottomNavigationBar: Container(
          child: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.bakery_dining_sharp),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ]),
        ),
      ),
    );
  }
}
