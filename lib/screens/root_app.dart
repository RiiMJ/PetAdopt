// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project2/screens/home.dart';
import 'package:project2/color.dart';
import 'package:project2/data.dart';
import 'package:project2/widgets/bottombar_item.dart';
import 'package:project2/screens/listScreen.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int activeTab = 0;
  List barItems = [
    {
      "icon": "assets/home-border.svg",
      "active_icon": "assets/home.svg",
      "page": const HomePage(),
      "title": ""
    },
    {
      "icon": "assets/pet-border.svg",
      "active_icon": "assets/pet.svg",
      "page": Container(
        child: const Center(
          child: Text("pet Page"),
        ),
      ),
      "title": ""
    },
    {
      "icon": "assets/setting-border.svg",
      "active_icon": "assets/setting.svg",
      "page": Container(
        child: const Center(
          child: Text("Setting Page"),
        ),
      ),
      "title": ""
    },
  ];
//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children: List.generate(
            barItems.length, (index) => animatedPage(barItems[index]["page"])));
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              barItems.length,
              (index) => BottomBarItem(
                    activeTab == index
                        ? barItems[index]["active_icon"]
                        : barItems[index]["icon"],
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      onPageChanged(index);
                    },
                  ))),
    );
  }
}
