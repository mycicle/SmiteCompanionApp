import "package:flutter/material.dart";
import "package:smite_app/classes/Build.dart";
import "package:smite_app/globals.dart" as globals;

class BuildDisplay extends StatefulWidget {
  final Build build;

  BuildDisplay({Key key, this.build});
  @override
  _BuildDisplayState createState() => _BuildDisplayState();
}

class _BuildDisplayState extends State<BuildDisplay> {

  Widget makeBuildGrid() {
    return OrientationBuilder(
        builder: (context, orientation)
        {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait)
                      ? 2 : 3
              ),
              itemCount: widget.build.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                    widget.build.items.elementAt(index).name,
                    style: globals.biggerFont
                );
              }
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return makeBuildGrid();
  }
}
