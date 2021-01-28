import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Getdata extends StatefulWidget {
  Getdata({Key key}) : super(key: key);

  @override
  _GetdataState createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conexión a MySQL'),
        centerTitle: true,
      ),
      //body: ,
    );
  }

  Future data() async {
    // CONSULTA PARA OBTENER TODOS LOS DATOS DE LA bd
    // var url = 'https://sipprueba1.000webhostapp.com/get.php';
    // http.Response response = await http.get(url);
    // var data = jsonDecode(response.body);
    // print(data.toString());
    // //print(data[1]['rfc'].toString()); //imprime solo el rfc

    final response =
        await http.post("https://sipprueba1.000webhostapp.com/get.php", body: {
      'rfc': 'CALR880326457',
    });

    var datauser = json.decode(response.body);//decodifica el json que obtine de la URL
    if (datauser.isEmpty) {
      print('No se encontraron datos');
    }else{
    //  print(datauser.toString());
      print(datauser[0]['rfc'].toString());
    }
   
  }

  @override
  void initState() {
    data();
  }
}
