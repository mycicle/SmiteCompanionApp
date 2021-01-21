import "package:flutter/material.dart";
import "package:smite_app/globals.dart" as globals;
import "package:smite_app/classes/God.dart";
import "package:smite_app/display_widgets/GodDisplay.dart";

class GodsPage extends StatefulWidget {
  @override
  _GodsPageState createState() => _GodsPageState();
}

class _GodsPageState extends State<GodsPage> {

  Widget buildRow(God god) {
    return ListTile(
      title: Text(
        god.name,
        style: globals.biggerFont,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.grey,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GodDisplay(god: god),
          )
        );
      },
    );
  }

  Widget GodsList() {
    return ListView.builder(
        itemCount: globals.godsRes.length,
        itemBuilder: (context, index) {
          God god = globals.godsRes.elementAt(index);
          return buildRow(god);
        },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gods Page"),
      ),
      body: GodsList(),
    );
  }
}
