import 'package:app_sp/components/text_field_container.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Login/components/background.dart';
import 'package:app_sp/Screens/Signup/signup_screen.dart';
import 'package:app_sp/components/already_have_an_account_acheck.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  bool _hiddenpassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.35,
            ),
            Image.network(
              "https://firebasestorage.googleapis.com/v0/b/spi-salario.appspot.com/o/fotos%20de%20usuarios%2Fluis_miguel.png?alt=media&token=23501f6f-2313-4983-97a1-8072ef73598d",
              width: size.height * 0.35,
              loadingBuilder: (context, child, progress)
              {
                return progress == null ? child: LinearProgressIndicator();
              },

            ),
             SizedBox(height: size.height * 0.03),
            Text("Nombre:Aldo Valdez Solis",style: TextStyle(fontSize:26),),
            Text("RFC:VASA980106FK6",style: TextStyle(fontSize:26),),
            _dataTable(),
            Text("Saldo: 56,900",style: TextStyle(fontSize:26),),
            Text("Saldo Disponible:1,500",style: TextStyle(fontSize:26),),
           /*Aquí va en contenido*/ 

            SizedBox(height: size.height * 0.03),

          ],
        ),
      ),
    );
  }

  Widget _dataTable()
  {
   return SingleChildScrollView(
     scrollDirection: Axis.horizontal,
        child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Entidad',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Saldo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Qnas restantes',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Caja libertad')),
              DataCell(Text('35,200')),
              DataCell(Text('43')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Inbursa')),
              DataCell(Text('15,400')),
              DataCell(Text('32')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Credito Maestro')),
              DataCell(Text('6,300')),
              DataCell(Text('18')),
            ],
          ),
        ],
      ),
   );
  }


  
}
