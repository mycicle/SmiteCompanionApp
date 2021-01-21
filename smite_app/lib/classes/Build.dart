import "package:smite_app/classes/Item.dart";

class Build {
  final String name;
  final Set<Item> items;

  Build(this.name, this.items) {
    assert(items.length == 7);
  }
}