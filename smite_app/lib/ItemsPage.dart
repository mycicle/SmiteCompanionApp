import "package:smite_app/globals.dart" as global;

import "package:flutter/material.dart";
import "package:smite_app/classes/SmiteResponses.dart";
import "package:smite_app/utils/smiteAPIUtils.dart";
import "package:smite_app/classes/Item.dart";
import "package:smite_app/display_widgets/ItemDisplay.dart";

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final itemsList = <Item>[];

  Widget _buildRow(Item item, int num) {
    return ListTile(
        title: Text(
          item.name,
          style: global.biggerFont,
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDisplay(item: item),
              )
          );
        }
    );
  }

  Widget itemsWidget(SessionResponse session) {
    print("ITEMS WIDGET");
    print("session: $session");
    return FutureBuilder(
        future: getItems(global.info, session),
        builder: (context, itemSnap) {
          print(itemSnap);
          if (itemSnap.hasData) {
            List<Item> items = itemSnap.data.where((item) => item.tier == 3).toList(); // THIS IS WHERE ITEMS ARE FILTERED TO ONLY TIER 3
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Item item = items[index];
                itemsList.add(item);
                return _buildRow(itemsList[index], index);
              },
            );
          } else if (itemSnap.hasError) {
            return Text("itemSnap Error: ${itemSnap.error}");
          } else if (itemSnap == null) {
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
            // make the items request to a future builder
            return itemsWidget(sessionSnap.data);
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
        title: Text("Items Page"),
      ),
      body: PageContent(),
    );
  }
}
