// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const int ANIMATED_BODY_MS = 500;

Color primaryGreen = const Color(0xff416d6d);
Color secondaryGreen = const Color(0xff16a085);
Color fadedBlack = Colors.black.withAlpha(150);
List<BoxShadow> customShadow = [
  const BoxShadow(
    color: Color.fromARGB(235, 161, 161, 161),
    blurRadius: 30,
    offset: Offset(0, 10),
  ),
];

List categories = [
  {"name": "All", "icon": "assets/pet-border.svg"},
  {"name": "Dog", "icon": "assets/dog.svg"},
  {"name": "Cat", "icon": "assets/cat.svg"},
  {"name": "Parrot", "icon": "assets/parrot.svg"},
  {"name": "Rabbit", "icon": "assets/rabbit.svg"},
  {"name": "Fish", "icon": "assets/fish.svg"},
  {"name": "Turtle", "icon": "assets/turtle.svg"},
];

List<Map> pets = [
  {
    "image": "assets/catpic.jpeg",
    "category": "cat",
    "name": "name",
    "breed": "breed",
    "location": "location",
    "description": "description",
    "id": "00001",
    "owner_name": "owner name",
    "contact_no": "12345",
    "sex": "male",
    "age": "3 months",
    "color": "brown",
    "album": ["assets/catpic.jpeg", "assets/catpic1.jpeg", "assets/catpic2.jpeg"],
  },
  {
    "image": "assets/dogpic.jpeg",
    "category": "dog",
    "name": "name",
    "breed": "breed",
    "location": "location",
    "description": "description",
    "id": "00002",
    "owner_name": "ownane",
    "contact_no": "12345",
    "sex": "female",
    "age": "2 years",
    "color": "brown",
    "album": ["assets/dogpic.jpeg", "assets/dogpic1.jpeg", "assets/dogpic2.jpeg"],
  },
];

