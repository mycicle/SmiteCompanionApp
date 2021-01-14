class Ability {
  final String name;
  final String desc;
  final String attribs;

  Ability({this.name, this.desc, this.attribs});

}

class God {
  final String name;
  final String lore;
  final Ability ab1;
  final Ability ab2;
  final Ability ab3;
  final Ability ab4;
  final Ability ab5; // passive

  God({this.name, this.lore, this.ab1, this.ab2, this.ab3, this.ab4, this.ab5});
}