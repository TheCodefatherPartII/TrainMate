import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

const firstPart = [
  "Boiling",
  "Fluffy",
  "Sharp",
  "Breezy",
  "Freezing",
  "Silky",
  "Bumpy",
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
  "Solid",
  "Dirty",
  "Melted",
  "Sticky",
  "Dry",
  "Painful",
  "Tender",
  "Dusty",
  "Prickly",
  "Encrusted",
  "Rough",
  "Uneven",
  "Filthy",
  "Shaggy",
  "Warm",
  "Flaky",
  "Shaky",
];

const secondPart = [
  // Large cats
  "Panther", "Wildcat", "Tiger", "Lion", "Cheetah", "Cougar", "Leopard",
  // Snakes
  "Viper", "Cottonmouth", "Python", "Boa", "Sidewinder", "Cobra",
  // Other predators
  "Grizzly", "Jackal", "Falcon",
  // Prey
  "Wildebeest", "Gazelle", "Zebra", "Elk", "Moose", "Deer", "Stag", "Pony",
  "Koala", "Sloth",
  // Mythical creatures
  "Mermaid", "Unicorn", "Fairy", "Troll", "Yeti", "Pegasus", "Griffin",
  "Dragon",
  // Occupations
  "Nomad", "Wizard", "Cleric", "Pilot", "Captain", "Commander", "General",
  "Major", "Admiral", "Chef",
  // Sea life
  "Octopus", "Lobster", "Crab", "Barnacle", "Hammerhead", "Orca", "Piranha",
  // Musical
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
  "Organ",
  "Banjo",
  // Tools
  "Mask", "Hammer", "Drill", "Compressor", "Wrench", "Mixer", "Router",
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
    this.image = "https://avatars.dicebear.com/v2/human/${this.id}";
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
