import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> options = [];

  _MenuProvider() {
    //_loadData();
  }

  Future<List<dynamic>> loadData() async {

    //this file simulate a json object from an API to do dynamic menu
    final response = await rootBundle.loadString('data/menu_opts.json');

    //use jsopn decode to convert a json object into a flutter Map
    Map dataMap = json.decode(response);
    options = dataMap['rutas'];
    
    return options;
  }
}

final menuProvider = new _MenuProvider();