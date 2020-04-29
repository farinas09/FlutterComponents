import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {

  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {

  double _sliderValue = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Sliders')
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget> [
             _createSlider(),
             _createCheckBox(),
             _createSwitch(),
             Expanded(
               child: _createImage()
               ),
           ],
         ),
       ),
    );
  }

  Widget _createSlider() {

    return Slider (
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen',
      //divisions: 10,
      value: _sliderValue,
      min: 0,
      max: 400,
      //if checkbox is checked, disable slider, else slider is enable
      onChanged: (_blockCheck) ? null :  (value) {
        setState(() {
          //to load image size
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createImage() {
    
    return Image(
      image: NetworkImage('https://areajugones.sport.es/wp-content/uploads/2020/03/dragon-ball-super-2-min.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {

    //default checkbox is too simple
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck, 
      onChanged: (value){
        setState(() {
          //to validate if the checkbox is checked
          _blockCheck = value;
        });
      });
  }

  Widget _createSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck, 
      onChanged: (value){
        setState(() {
          //to validate if the checkbox is checked
          _blockCheck = value;
        });
      });
  }
}