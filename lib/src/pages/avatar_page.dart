import 'package:flutter/material.dart';
 
 
class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage('https://img.pngio.com/avatar-icon-png-105-images-in-collection-page-3-avatarpng-512_512.png'),
                  //radius: 2.0,
                ),
            ),
            Container(
              margin: EdgeInsets.only(right: 5.0),
              child: CircleAvatar(
                child: Text("SL"),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
          ],
        ),
        body: Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://img.pngio.com/avatar-icon-png-105-images-in-collection-page-3-avatarpng-512_512.png'),
          ),
        ),
    );
  }
}