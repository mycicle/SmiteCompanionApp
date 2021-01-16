import "package:flutter/material.dart";
import "package:smite_app/classes/God.dart";

class GodDisplay extends StatefulWidget {
  God god;

  GodDisplay({Key key, this.god}) : super(key: key);
  @override
  _GodDisplayState createState() => _GodDisplayState();
}

class _GodDisplayState extends State<GodDisplay> {

  Widget GodInformation() {
      return Text(
        "LORE: \n" +
        widget.god.lore + '\n\n' +
        "ABILITY 1: \n" +
        widget.god.ab1.name + '\n\n' +
        "ABILITY 2: \n" +
        widget.god.ab2.name + '\n\n' +
        "ABILITY 3: \n" +
        widget.god.ab3.name + '\n\n' +
        "ABILITY 4: \n" +
        widget.god.ab4.name + '\n\n' +
        "PASSIVE: \n" +
        widget.god.ab5.name
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.god.name + " Information"),
      ),
      body: GodInformation(),
    );
  }
}
