import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(6.0),
        children: <Widget> [
          _cardTipo1()
        ],
      ),
    );
  }

  _cardTipo1() {

    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.phone_iphone),
            title: Text("Card Title"),
            subtitle: Text("This is a card sample"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {

              },
              child: Text("Okay"))
            ],
          ),
        ]
      ),
    );

  }
}