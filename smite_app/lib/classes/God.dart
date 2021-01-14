class Ability {
  final String name;
  final String desc;
  final List<String> attribs;

  Ability({this.name, this.desc, this.attribs});

}

class God {
  final Ability ab1;
  final Ability ab2;
  final Ability ab3;
  final Ability ab4;
  final Ability ab5; // passive

  God({this.ab1, this.ab2, this.ab3, this.ab4, this.ab5});
}