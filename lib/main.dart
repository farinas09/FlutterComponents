import 'package:flutter/material.dart';

import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
      );
  }
}