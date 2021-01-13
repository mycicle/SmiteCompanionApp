import "package:flutter/material.dart";
import "package:smite_app/Album.dart";
import 'package:smite_app/AuthInfo.dart';
import 'package:smite_app/smiteAPIUtils.dart';
import "package:smite_app/SmiteResponses.dart";

class GodsPage extends StatefulWidget {
  @override
  _GodsPageState createState() => _GodsPageState();
}

class _GodsPageState extends State<GodsPage> {

  // Future<Album> futureAlbum;
  AuthInfo info = AuthInfo(
    devID: "1234",
    authKey: "5678",
  );

  Future<SessionResponse> futureSession;
@override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
    futureSession = fetchSessionResponse(info);
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch data for gods page"),
      ),
      body: FutureBuilder<SessionResponse>(
        future: futureSession,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.sessionID);
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
