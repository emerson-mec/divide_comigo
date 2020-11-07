import 'package:flutter/material.dart';

class ApagarTudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja apagar tudo?'),
      content: Text('Está ação é irreversível'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            'Apagar',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}
