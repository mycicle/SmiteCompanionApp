import "package:flutter/material.dart";
import "package:smite_app/classes/Item.dart";
import "package:smite_app/display_widgets/ItemDisplay.dart";

class BuildDisplay extends StatefulWidget {
  Set<Item> items;

  BuildDisplay({Key key, this.items});
  @override
  _BuildDisplayState createState() => _BuildDisplayState();
}

class _BuildDisplayState extends State<BuildDisplay> {

  Widget buildWidget() {
    if (widget.items.length != 7) {
      return Text("INVALID NUMBER OF ITEMS: EXPECTED 7, GOT ${widget.items.length}");
    }

    return OrientationBuilder(
        builder: (context, orientation)
        {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait)
                      ? 2 : 3
              ),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Text("Hello");
              }
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildWidget();
  }
}
