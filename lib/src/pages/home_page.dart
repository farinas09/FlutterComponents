import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
 

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _createList(
      ),
    );
  }

  Widget _createList() {

    //print(menuProvider.options);

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {

        return ListView(
          children: _setupList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget>_setupList(List<dynamic> data, BuildContext context) {

    final List<Widget> options = [];

    data.forEach( (opc) {

      final widgetTemp = ListTile(
        title: Text( opc['texto']),
        leading: getIcon(opc['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          //final route = MaterialPageRoute(
            //builder: (context) => AlertPage()
            //);

          //Navigator.push(context, route);

          Navigator.pushNamed(context, opc['ruta']);
        },
      );
      options..add(widgetTemp)
             ..add(Divider());
    });

    return options;

  }

}