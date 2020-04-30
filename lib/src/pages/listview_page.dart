import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  //this var can observe all scroll data, position, end.
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem =0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addImages();

    //listener have all scrollcontroller callbacks
    _scrollController.addListener(() {
      //verify that scroll is at the max scroll extent
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
    //to terminate de scroll controller
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

    //refresh indicator can implements onRefresh to observe pull to refresh action
    return RefreshIndicator(

      onRefresh: _getPage1,
      child: ListView.builder(
      itemCount: _numberList.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        final image = _numberList[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('http://picsum.photos/500/300/?image=$image'));
        },
      ),
    );
  }

  //counter to add numers to number list and then set Widget State
  void _addImages() {
    for (var i = 1; i<=10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {
      
    });
  }

  //fetch data is only a future to set animation by the Timer with "httpresponse" method
  Future<Null> fetchData() async {
    final Duration duration= new Duration(seconds: 1);

    _isLoading = true;
    setState(() {
      
    });
    return new Timer(duration , httpResponse);
  }

  //this method simulate a call to http request, animating the scrollview and loading new images
  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels +400,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250));
    _addImages();
  }

  //method to inflate the circular progress bar, if _isloading is false, then return an empty container
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

  //pull to refresh method to await 2 seconds with the refresh animation and call _addimages method
  //to set images
  Future<Null>_getPage1() async {
    final duration = Duration(seconds: 2);
    new Timer( duration, () {

      _numberList.clear();
      _lastItem++;
      _addImages();

    });
    return Future.delayed(duration);
  }
}