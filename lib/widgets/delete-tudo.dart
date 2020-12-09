import 'package:divide_comigo/Provider/item-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApagarTudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemProvider itemRow = Provider.of<ItemProvider>(context);

    return AlertDialog(
      title: Text('Deseja apagar tudo?'),
      content: Text(
        'Está ação é irreversível',
        style: TextStyle(color: Colors.grey),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            itemRow.apagarTudo();
            Navigator.pop(context);
          },
          child: Text(
            'Apagar',
            style:
                TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w400),
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
