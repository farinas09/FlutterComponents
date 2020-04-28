import 'package:flutter/material.dart';
 
 
class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alertas'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Mostrar Alerta"),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: ()=> _showAlert(context),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    );
  }

  void _showAlert(context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
          title: Text("Título"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Contenido"),
              FlutterLogo( size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: ()=> Navigator.of(context).pop(), child: Text("Cancelar")),
            FlatButton(onPressed: (){}, child: Text("Aceptar")),
          ],
          
        );
      }
      );
  }
}