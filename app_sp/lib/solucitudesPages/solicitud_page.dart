import 'package:flutter/material.dart';

class SolicitudPage extends StatelessWidget {
  final List<String> _bancos = ['INBURSA', 'BBVA', 'CREDITO MAESTRO', '..'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitud de prestamos"),
      ),
      body: formulario(context),
    );
  }

  Widget formulario(BuildContext context)
  {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
        child: ListView(        
          children: <Widget>[
            _imprimirDatosIniciales(context),
            nombre(),
            SizedBox(height: 20.0,),
            apellidos(),
            SizedBox(height: 20.0,),
            correo(),
            SizedBox(height: 20.0,),
            Text("Empresa/Producto:"),
            _crearDropdown(),
            SizedBox(height: 20.0,),
            montoSolicitado(),
            SizedBox(height: 20.0,),
            qnas(),
            SizedBox(height: 20.0,),
            montoTotal(),
            SizedBox(height: 20.0,),
            montoQnal(),
            SizedBox(height: 20.0,),
            Text("Detalle:"),
            SizedBox(height: 20.0,),
            capacidadRestante(),
            SizedBox(height: 20.0,),
            capacidadDisponible()
          ],
        ),
      );
  }

   Widget _imprimirDatosIniciales(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Aldo Valdez Solis',
          style: TextStyle(fontSize: size.width * 0.06),
        ),
        SizedBox(height: size.height * 0.01),
        Text('Dependencia: Secretaria de Educación Publica',
          style: TextStyle(fontSize: size.width *0.06), textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.01,),
        Text(
          'RFC: CUPU800825569',
          style: TextStyle(color: Colors.black45, fontSize: size.width * 0.05),
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }

  Widget nombre ()
  {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Nombre:",
        labelText: "Nombre",
        helperText: "Solo tú nombre",
        suffixIcon: Icon(Icons.create_outlined),
        icon: Icon(Icons.create_outlined),
      ),
    );
  }
  Widget apellidos ()
  {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Apellidos:",
        labelText: "Apellidos",
        helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.create_outlined),
        icon: Icon(Icons.create_outlined),
      ),
    );
  }

Widget montoSolicitado ()
  {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Monto solicitado:",
        labelText: "Monto a solicitar",
        //helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.attach_money_outlined),
        icon: Icon(Icons.attach_money_outlined),
      ),
    );
  }

  Widget qnas ()
  {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Quincenas:",
        labelText: "Quincenas",
        //helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.av_timer_outlined),
        icon: Icon(Icons.av_timer_outlined),
      ),
    );
  }


Widget montoTotal ()
  {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Monto total:",
        labelText: "Monto total",
        //helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.attach_money_outlined),
        icon: Icon(Icons.attach_money_outlined),
      ),
    );
  }

Widget montoQnal ()
  {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Monto quincenal:",
        labelText: "Monto quincenal",
        //helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.attach_money_outlined),
        icon: Icon(Icons.attach_money_outlined),
      ),
    );
  }

  Widget capacidadRestante ()
  {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Capacidad restante:",
        labelText: "Capacidad restante",
        //helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.attach_money_outlined),
        icon: Icon(Icons.attach_money_outlined),
      ),
    );
  }

  Widget capacidadDisponible ()
  {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Capacidad disponible:",
        labelText: "Capacidad disponible",
        //helperText: "Solo tus apellidos",
        suffixIcon: Icon(Icons.attach_money_outlined),
        icon: Icon(Icons.attach_money_outlined),
      ),
    );
  }
Widget correo ()
  {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text("Cantidad de letras:"),
        hintText: "Correo electrónico:",
        labelText: "Correo electrónico",
        helperText: "Su correo electrónico",
        suffixIcon: Icon(Icons.remove_red_eye),
        icon: Icon(Icons.alternate_email),
      ),
    );
  }

  
  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: DropdownButton(
            value: "INBURSA",
            items: getOpsDropDown(),
            onChanged: (opc) 
            {
            },
          ),
        ),
      ],
    );
  }
  List<DropdownMenuItem<String>> getOpsDropDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _bancos.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

}