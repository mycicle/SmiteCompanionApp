import "package:flutter/material.dart";
import "package:smite_app/classes/God.dart";

class GodDisplay extends StatefulWidget {
  God god;

  GodDisplay({Key key, this.god}) : super(key: key);
  @override
  _GodDisplayState createState() => _GodDisplayState();
}

class _GodDisplayState extends State<GodDisplay> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.god.name + " Information"),
      ),
      body: Container(),
    );
  }
}
