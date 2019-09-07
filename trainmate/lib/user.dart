import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

const firstPart = [
  "Fluffy",
  "Freezing",
  "Fuzzy",
  "Slick",
  "Chilly",
  "Cold",
  "Hard",
  "Cool",
  "Hot",
  "Smooth",
  "Cuddly",
  "Icy",
  "Soft",
  "Sticky",
  "Dry",
  "Dusty",
  "Prickly",
  "Shaggy",
  "Warm",
  "Flaky",
  "Shaky",
];

const secondPart = [
  "Panther",
  "Tiger",
  "Lion",
  "Cheetah",
  "Cougar",
  "Leopard",
  "Viper",
  "Python",
  "Boa",
  "Cobra",
  "Grizzly",
  "Falcon",
  "Wildebeest",
  "Gazelle",
  "Zebra",
  "Elk",
  "Moose",
  "Deer",
  "Pony",
  "Koala",
  "Sloth",
  "Unicorn",
  "Yeti",
  "Pegasus",
  "Griffin",
  "Dragon",
  "Nomad",
  "Wizard",
  "Cleric",
  "Pilot",
  "Captain",
  "Commander",
  "General",
  "Major",
  "Admiral",
  "Chef",
  "Octopus",
  "Lobster",
  "Crab",
  "Barnacle",
  "Hammerhead",
  "Orca",
  "Piranha",
  "Piano",
  "Keyboard",
  "Guitar",
  "Trumpet",
  "Trombone",
  "Flute",
  "Cornet",
  "Horn",
  "Tuba",
  "Clarinet",
  "Saxophone",
  "Piccolo",
  "Violin",
  "Harp",
  "Cello",
  "Drum",
  "Banjo",
  "Mask",
  "Vacuum",
];

String pickName() {
  final first = firstPart[Random().nextInt(firstPart.length)];
  final second = secondPart[Random().nextInt(secondPart.length)];
  return '$first $second';
}

Color pickColour() {
  return Color.fromRGBO(
    50 + Random().nextInt(180),
    50 + Random().nextInt(180),
    50 + Random().nextInt(180),
    1,
  );
}

class User extends Model {
  User(this.id) {
    this.name = pickName();
    this.image = "https://avatars.dicebear.com/v2/human/${this.id}.svg?t=${Random().nextInt(4)}";
    this.colour = pickColour();
  }

  final String id;
  String name;
  String image;
  Color colour;

  static User of(BuildContext context) {
    return ScopedModel.of<User>(context);
  }
}
