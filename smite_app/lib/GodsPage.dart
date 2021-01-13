import "package:flutter/material.dart";
import "package:smite_app/SmiteResponses.dart";
import "package:smite_app/smiteAPIUtils.dart";
import 'package:smite_app/globals.dart' as global;

class GodsPage extends StatefulWidget {
  @override
  _GodsPageState createState() => _GodsPageState();
}

class _GodsPageState extends State<GodsPage> {

  GodsResponse godsResponse;
  @override
  void initState() {
    fetchSessionResponse(global.info).then(
            (SessionResponse res) {
              print("getting session");
              global.session = res;
              fetchGodsResponse(global.info, res).then(
                  (GodsResponse gRes) {
                    godsResponse = gRes;
                  }
              );
        }, onError: (error) {
              print("Could not create SMITE API session");
              throw Exception(error);
        }
    );


  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch data for gods page"),
      ),
      body: Text(godsResponse.body),
    );
  }
}



// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: Text("Fetch data for gods page"),
//       ),
//       body: FutureBuilder<GodsResponse>(
//         future: godsResponse,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Text(snapshot.data.body);
//           } else if (snapshot.hasError) {
//             return Text("${snapshot.error}");
//           }
//           //by default show the loading spinner
//           return CircularProgressIndicator();
//         },
//       )
//   );
// }
