import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = "";
  String _email = "";
  String _date = "";
  List<String> _powers = ['Volar', 'Rayos X', 'Super fuerza', 'Super aliento'];
  String _optionSelected ='';

  TextEditingController _inputDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Text"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmailField(),
          Divider(),
          _createPasswordField(),
          Divider(),
          _createDateField(context),
          Divider(),
          _createPerson(),
          Divider(),
          _createDropDownMenu(),
        ],
      ),
    );
  }

  Widget _createInput() {
    
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text("Letras ${_name.length}"),
        hintText: "Nombre",
        labelText: "Nombre",
        helperText: 'Nombre Completo',
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        setState(() {
        _name = valor;

        });
      },
    );
  }

  Widget _createPerson() {
    
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _createEmailField() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: "Correo electrónico",
        labelText: "Correo electrónico",
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {
        _email = valor;
        })
    );
  }

  Widget _createPasswordField() {

    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: "Contraseña",
        labelText: "Contraseña",
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() {
        
        })
    );
  }

  _createDateField(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: "Fecha de Nacimiento",
        labelText: "Fecha de Nacimiento",
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2010),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
      );
    
    if(picker!=null) {
      setState(() {
        _date = picker.toString();
        _inputDateController.text = _date;
        });
      }
    }

  _createDropDownMenu() {

    return DropdownButton(
      items: getMenuItems(),
      onChanged: (dropDownOptions) {

      });
  }

  List<DropdownMenuItem<String>> getMenuItems() {

    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach( (power) {
      list.add( DropdownMenuItem (
        child: Text(power),
        value: power
        ));
      });

    return list;
  }
}