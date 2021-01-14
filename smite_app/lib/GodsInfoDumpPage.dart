import "package:smite_app/globals.dart" as global;
import "package:flutter/material.dart";
import 'package:smite_app/classes/SmiteResponses.dart';
import 'package:smite_app/classes/God.dart';
import "package:smite_app/utils/smiteAPIUtils.dart";

class GodsInfoDumpPage extends StatefulWidget {
  @override
  _GodsInfoDumpPageState createState() => _GodsInfoDumpPageState();
}

class _GodsInfoDumpPageState extends State<GodsInfoDumpPage> {
  SessionResponse session;
  final godsList = <God>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    getSession(global.info).then(
        (SessionResponse sess) {
          session = sess;
          print("Successfully created session");
          session.cout();
        }
    );
  }

  Widget _buildRow(God god) {
    return ListTile(
      title: Text(
        "Hello there",
        style: _biggerFont,
      ),
    );
  }

  Widget godsWidget() {
    return FutureBuilder(
        future: getGods(global.info, session),
        builder: (context, godSnap) {
          if (godSnap.hasData) {
            return ListView.builder(
              itemCount: godSnap.data.length,
              itemBuilder: (context, index) {
                God god = godSnap.data[index];
                godsList.add(god);
                return _buildRow(godsList[index]);
              },
            );
          } else if (godSnap.hasError) {
            return Text("godSnap Error: ${godSnap.error}");
          } else if (godSnap == null) {
            return Text("null");
          }
          return CircularProgressIndicator();
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gods Info Dump Page"),
      ),
      body: godsWidget(),
    );
  }
}
