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
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
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
              FlatButton(onPressed: () {},
              child: Text("Cancelar")),
              FlatButton(onPressed: () {},
              child: Text("Aceptar")),
            ],
          ),
        ]
      ),
    );

  }

  _cardTipo2() {

    return Card(
      child: Column(
        children: <Widget> [

          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://unsplash.com/photos/twukN12EN7c/download'),
            fadeInDuration: Duration(milliseconds: 100),
            height: 250.0,
            ),
          //Image(
            //image: NetworkImage('https://unsplash.com/photos/twukN12EN7c/download'),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Ejemplo")),
        ],
      ),
    );
  }
}