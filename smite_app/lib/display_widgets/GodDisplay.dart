import "package:flutter/material.dart";
import "package:smite_app/classes/God.dart";
import "package:smite_app/classes/Build.dart";
import "package:smite_app/display_widgets/BuildDisplay.dart";
import "package:smite_app/globals.dart" as globals;

class GodDisplay extends StatefulWidget {
  final God god;

  GodDisplay({Key key, this.god}) : super(key: key);
  @override
  _GodDisplayState createState() => _GodDisplayState();
}

class _GodDisplayState extends State<GodDisplay> {

  Widget BuildListTile(Build build) {
    return ListTile(
      title: Text(
        build.name,
        style: globals.biggerFont
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.grey,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BuildDisplay(build: build)
          )
        );
      }
    );
  }

  Widget GodInformation() {
    if (widget.god.builds == null) {
      return Center(
          child: Text("No Build",
                      style: globals.biggerFont
          ),
      );
    }
      return ListView.builder(
        itemCount: widget.god.builds.length,
        itemBuilder: (context, index) {
          return BuildListTile(widget.god.builds.elementAt(index));
        }
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