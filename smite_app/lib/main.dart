import 'package:flutter/material.dart';
import 'package:smite_app/GodsPage.dart';
import "package:smite_app/ItemsPage.dart";

void main() {
  runApp(SmiteApp());
}

class SmiteApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smite Builds App",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SmiteAppHomepage(),
      initialRoute: "/",
      routes: {
        // go to the home screen
        '/Gods': (context) => GodsPage(),
        '/Categories': (context) => SmiteAppHomepage(),
        '/Items': (context) => ItemsPage(),
        '/MyBuilds': (context) => SmiteAppHomepage(),
        '/NewBuild': (context) => SmiteAppHomepage(),
      }
    );
  }
}

class SmiteAppHomepage extends StatefulWidget {
  @override
  _SmiteAppHomepageState createState() => _SmiteAppHomepageState();
}

class _SmiteAppHomepageState extends State<SmiteAppHomepage> {

  Widget _buildMenuLink(String name) {
    final _menuLinkFont = TextStyle(fontSize: 18.0);
    return ListTile(
      title: Text(
        name,
        style: _menuLinkFont
      ),
      trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.grey,
      ),
      onTap: () {
        //navigate to proper route
        Navigator.pushNamed(context, "/$name");
      },
    );
  }

  Widget _HomepageMenu() {
    final _menuItemNames = <String>{
      "Gods",
      "Categories",
      "Items",
      "MyBuilds",
      "NewBuild",
    };

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: _menuItemNames.length*2,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        return _buildMenuLink(_menuItemNames.elementAt(i ~/ 2));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smite Builds App"),
      ),
      body: _HomepageMenu(),
    );
  }
}


