import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final opciones = ["uno", "dos", "tres", "cuatro", "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
      
        children: _initWidgetsShort(),
      ),
    );
  }

  List<Widget> _initWidgets() {

    List<Widget> list = new List<Widget>();
    for (var opt in opciones) {
      final tempWidget = new ListTile(
        title: Text("$opt"),
      );
      list..add(tempWidget)
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _initWidgetsShort() {

    var widgets = opciones.map(( item ){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("xdxd"),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.delete),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();

    return widgets;
  }
}