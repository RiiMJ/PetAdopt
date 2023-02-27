// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project2/color.dart';
import 'package:project2/data.dart';
import 'package:project2/widgets/category_item.dart';
import 'package:project2/widgets/pet_item.dart';
import 'package:project2/screens/detailsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ));
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.place_outlined,
                    color: labelColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              const Text("location... ",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  )),
            ],
          )),
        ],
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 25,
          ),
          getCategories(),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text("Welcome to Pet Adoption App!",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                )),
          ),
          getPets(),
        ]),
      ),
    );
  }

  int selectedCategory = 0;
  getCategories() {
    List<Widget> lists = List.generate(
        categories.length,
        (index) => CategoryItem(
              data: categories[index],
              selected: index == selectedCategory,
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
            ));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  getPets() {
    List<Map> dogs = [];
    dogs.addAll(pets);
    dogs.retainWhere((item) => item['category'] == 'dog');

    List<Map> cats = [];
    cats.addAll(pets);
    cats.retainWhere((item) => item['category'] == 'cat');

    List<Map> parrots = [];
    parrots.addAll(pets);
    parrots.retainWhere((item) => item['category'] == 'parrot');

    List<Map> rabbits = [];
    rabbits.addAll(pets);
    rabbits.retainWhere((item) => item['category'] == 'rabbit');

    List<Map> fish = [];
    fish.addAll(pets);
    fish.retainWhere((item) => item['category'] == 'fish');

    List<Map> turtle = [];
    turtle.addAll(pets);
    turtle.retainWhere((item) => item['category'] == 'turtle');

    double width = MediaQuery.of(context).size.width * .8;
    List<Map> selectList = [];

    if (selectedCategory == 0) {
      selectList = pets;
    } else if (selectedCategory == 1) {
      selectList = dogs;
    } else if (selectedCategory == 2) {
      selectList = cats;
    } else if (selectedCategory == 3) {
      selectList = parrots;
    } else if (selectedCategory == 4) {
      selectList = rabbits;
    } else if (selectedCategory == 5) {
      selectList = fish;
    } else if (selectedCategory == 6) {
      selectList = turtle;
    }

    for (int i = 0; i < categories.length; i++) {}
    return CarouselSlider(
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .8,
        ),
        items: List.generate(
            selectList.length,
            (index) => PetItem(
                  data: selectList[index],
                  width: width,
                  onTap: () {
                    detailsScreen(id: selectList[index]['id']);
                  },
                )));
  }
}
