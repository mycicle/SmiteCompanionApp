import "package:flutter/material.dart";
import 'package:smite_app/classes/SmiteResponses.dart';
import "package:smite_app/globals.dart" as globals;
import 'package:smite_app/utils/smiteAPIUtils.dart';
import "package:smite_app/GodsPage.dart";

void main() {
  runApp(SmiteApp());
}

class SmiteApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smite Companion App",
      theme: globals.mainTheme,
      home: SmiteAppHomepage(),
      initialRoute: "/",
      routes: {
        "/Gods" : (context) => GodsPage(),
      }
    );
  }
}


//==============================================================================
class SmiteAppHomepage extends StatefulWidget {
  @override
  _SmiteAppHomepageState createState() => _SmiteAppHomepageState();
}

class _SmiteAppHomepageState extends State<SmiteAppHomepage> {

//============================================================
  Widget buildMenuLink(String caption) {
    return ListTile(
      title: Text(
        caption,
        style: globals.menuLinkStyle,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.grey,
      ),
      onTap: () {
        Navigator.pushNamed(context, "/$caption");
      }
    );
  }

  Widget HomepageWithSession(SessionResponse res) {
    globals.sessionRes = res;

    final menuItems = <String>{
      "Gods",
    };

    return FutureBuilder(
      future: getGods(globals.info, globals.sessionRes),
      builder: (context, godsSnap) {
        if (godsSnap.hasData) {
          globals.godsRes = godsSnap.data;
          return  ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: menuItems.length * 2,
                    itemBuilder: (context, i) {
                      if (i.isOdd) { return Divider(); }
                      return buildMenuLink(menuItems.elementAt(i ~/ 2));
                    },
          );
        } else if (godsSnap.hasError) {
          return Center(child: Text("Unable to make getgods SMITE API Request"));
        } else if (godsSnap == null) {
          return Center(child: Text("Gods Snap Null"));
        }

        return Center(child: LinearProgressIndicator(semanticsLabel: "Getting Gods",value: .66,),);
      }
    );
  }
//============================================================


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SmiteCompanionApp"),
      ),
      body: FutureBuilder(
        future: getSession(globals.info),
        builder: (context, sessionSnap) {
          if (sessionSnap.hasData) {
            return HomepageWithSession(sessionSnap.data);
          } else if (sessionSnap.hasError) {
            print("session snap error");
            return Center(child: Text("Unable to create SMITE API session"),);
          } else if (sessionSnap == null) {
            print("Null");
            return Center(child: Text("Session Snap Null"),);
          }

          return Center(child: LinearProgressIndicator(semanticsLabel: "Getting Session", value: .33,),);
        }
      )
    );
  }
//============================================================
}
//==============================================================================