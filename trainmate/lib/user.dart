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
  "Melted",
  "Sticky",
  "Dry",
  "Painful",
  "Tender",
  "Dusty",
  "Prickly",
  "Shaggy",
  "Warm",
  "Flaky",
  "Shaky",
];

const secondPart = [
  "Panther",
  "Wildcat",
  "Tiger",
  "Lion",
  "Cheetah",
  "Cougar",
  "Leopard",
  "Viper",
  "Cottonmouth",
  "Python",
  "Boa",
  "Sidewinder",
  "Cobra",
  "Grizzly",
  "Jackal",
  "Falcon",
  "Wildebeest",
  "Gazelle",
  "Zebra",
  "Elk",
  "Moose",
  "Deer",
  "Stag",
  "Pony",
  "Koala",
  "Sloth",
  "Mermaid",
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
  "Hammer",
  "Drill",
  "Wrench",
  "Mixer",
  "Router",
  "Vacuum",
];

String pickName() {
  final first = firstPart[Random().nextInt(firstPart.length)];
  final second = secondPart[Random().nextInt(secondPart.length)];
  return '$first $second';
}

Color pickColour() {
  return Color.fromRGBO(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    1,
  );
}

class User extends Model {
  User(this.id) {
    this.name = pickName();
    this.image = "https://avatars.dicebear.com/v2/human/${this.id}.svg";
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
