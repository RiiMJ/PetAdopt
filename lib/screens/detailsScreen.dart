import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/data.dart';
import 'package:project2/widgets/custom_button.dart';

class detailsScreen extends StatelessWidget {
  String id;
  //Color color;
  detailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String image = '';
    String name = '';
    String breed = '';
    String location = '';
    String description = '';
    String owner_name = '';
    String sex = '';
    String age = '';
    String color = '';
    String album = '';

    pets.forEach((pets) {
      if (pets['id'] == id) {
        image = pets[''];
        name = pets['name'];
        breed = pets['breed'];
        location = pets['location'];
        description = pets['description'];
        owner_name = pets['owner_name'];
        sex = pets['sex'];
        age = pets['age'];
        color = pets['color'];
        album = pets['album'];
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 30),
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Hero(
                            tag: id,
                            child: Image.asset(
                              image,
                              width: size.width * 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/profile.jpg'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              /*Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(                                  Text(
                                    'owner',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),*/
                              Expanded(child: Container()),
                              Text(
                                'Dec 16, 2020',
                                style: TextStyle(
                                  color: fadedBlack,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            description,
                            style: TextStyle(
                              color: fadedBlack,
                              height: 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 42,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.chevron_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.tray_arrow_down,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: customShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: fadedBlack,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        sex == 'female' ? Icons.female : Icons.male,
                        size: 22,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        breed,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        age,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 18,
                        color: primaryGreen,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 14,
                          color: fadedBlack,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /*Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomIconButton(
                      iconData: CupertinoIcons.heart,
                      onTap: () {},
                    ),
                  ),*/
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: CustomButton(
                        label: 'Adopt',
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
