import "package:flutter/material.dart";
import "package:smite_app/classes/Item.dart";

class ItemDisplay extends StatefulWidget {
  Item item;

  ItemDisplay({Key key, this.item}) : super(key: key);
  @override
  _ItemDisplayState createState() => _ItemDisplayState();
}

class _ItemDisplayState extends State<ItemDisplay> {
  Widget ItemInformation() {
    return Text(
        "NAME: \n" +
        widget.item.name + '\n\n' +
        "DESCRIPTION: \n" +
        widget.item.desc + '\n\n' +
        "PRICE: \n" +
        widget.item.price + '\n\n' +
        "ITEM ICON LINK: \n" +
        widget.item.iconLink + '\n\n'
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name + "Information"),
      ),
      body: ItemInformation(),
    );
  }
}
