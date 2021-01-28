import 'package:flutter/material.dart';

class ConsultarPrestamosPage extends StatelessWidget {
  const ConsultarPrestamosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Préstamos'),
      ),
      body: listaPrestamos(context),
    );
  }

  Widget listaPrestamos(BuildContext context) {
    //se debe cambiar por un listview builder con infinite scroll,(transformar el widget a stateful)
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Préstamo 1'),
          subtitle: Text('Financiera'),
          trailing: Text('\$50000'),
          onTap: () {
            Navigator.pushNamed(context, 'detallesPrestamo');
          },
        ),
        Divider(),
        ListTile(
          title: Text('Préstamo 1'),
          subtitle: Text('Financiera'),
          trailing: Text('\$50000'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Préstamo 1'),
          subtitle: Text('Financiera'),
          trailing: Text('\$50000'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Préstamo 1'),
          subtitle: Text('Financiera'),
          trailing: Text('\$50000'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Préstamo 1'),
          subtitle: Text('Financiera'),
          trailing: Text('\$50000'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Préstamo 1'),
          subtitle: Text('Financiera'),
          trailing: Text('\$50000'),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }
}
