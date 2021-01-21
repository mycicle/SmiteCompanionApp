import "package:smite_app/globals.dart" as global;
import "package:flutter/material.dart";
import 'package:smite_app/classes/SmiteResponses.dart';
import "package:smite_app/classes/Build.dart";
import 'package:smite_app/classes/God.dart';
import "package:smite_app/utils/smiteAPIUtils.dart";
import "package:smite_app/display_widgets/GodDisplay.dart";

class GodsPage extends StatefulWidget {
  @override
  _GodsPageState createState() => _GodsPageState();
}

class _GodsPageState extends State<GodsPage> {
  // SessionResponse session;
  final godsList = <God>[];
  final buildList = <Build>[];
  Widget _buildRow(God god, int num) {
    return ListTile(
        title: Text(
          god.name,
          style: global.biggerFont,
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GodDisplay(god: god),
              )
          );
        }
    );
  }

  Widget godsWidget(SessionResponse session) {
    print("GODS WIDGET");
    print("session: $session");
    return FutureBuilder(
        future: getGods(global.info, session),
        builder: (context, godSnap) {
          print(godSnap);
          if (godSnap.hasData) {
            return ListView.builder(
              itemCount: godSnap.data.length,
              itemBuilder: (context, index) {
                God god = godSnap.data[index];
                godsList.add(god);
                return _buildRow(godsList[index], index);
              },
            );
          } else if (godSnap.hasError) {
            return Text("godSnap Error: ${godSnap.error}");
          } else if (godSnap == null) {
            print("null");
            return Text("null");
          }
          return CircularProgressIndicator();
        }
    );
  }

  Widget PageContent() {
    return FutureBuilder(
        future: getSession(global.info),
        builder: (context, sessionSnap) {
          if (sessionSnap.hasData) {
            // make the gods request to a future builder
            return godsWidget(sessionSnap.data);
          } else if (sessionSnap.hasError) {
            print("session snap error");
            return Text("sessionSnap Error: ${sessionSnap.error}");
          } else if (sessionSnap == null) {
            print("null");
            return Text("null");
          }

          return CircularProgressIndicator();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Called Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Gods Info Dump Page"),
      ),
      body: PageContent(),
    );
  }
}
