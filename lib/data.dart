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
    "id": "12345",
    "owner_name": "ownane",
    "sex": "male",
    "age": "2",
    "color": "brown",
    "album": ["assets/catpic.jpeg"],
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
    "sex": "female",
    "age": "2 years",
    "color": "brown",
    "album": ["assets/dogpic.jpeg"],
  },
];
