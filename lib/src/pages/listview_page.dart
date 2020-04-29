import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem =0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addImages();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_addImages();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Stack(
        children: <Widget> [
          _createList(),
        _createLoading(),
        ],
      ),  
    );
  }

  Widget _createList() {

    return ListView.builder(
      itemCount: _numberList.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        final image = _numberList[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('http://picsum.photos/500/300/?image=$image'));
        },
      );
  }

  void _addImages() {
    for (var i = 1; i<=10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {
      
    });
  }

  Future<Null> fetchData() async {
    final Duration duration= new Duration(seconds: 1);

    _isLoading = true;
    setState(() {
      
    });
    return new Timer(duration , httpResponse);
  }

  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels +400,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250));
    _addImages();
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}