import "package:flutter/material.dart";
import "package:smite_app/Album.dart";
import 'package:smite_app/smiteAPIUtils.dart';

class GodsPage extends StatefulWidget {
  @override
  _GodsPageState createState() => _GodsPageState();
}

class _GodsPageState extends State<GodsPage> {

  Future<Album> futureAlbum;

@override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch data for gods page"),
      ),
      body: FutureBuilder<Album>(
        future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            //by default show the loading spinner
            return CircularProgressIndicator();
          },
      )
    );
  }
}
