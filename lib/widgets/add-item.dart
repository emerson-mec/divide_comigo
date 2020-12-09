import 'package:divide_comigo/Provider/item-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController itemController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  int _radioValuePagador = -1;
  String pagador = '';
  void _pagadorChange(int value) {
    setState(() {
      _radioValuePagador = value;
    });
    switch (_radioValuePagador) {
      case 0:
        pagador = Provider.of<ItemProvider>(context, listen: false).user1();
        print(pagador);

        break;
      case 1:
        pagador = Provider.of<ItemProvider>(context, listen: false).user2();
        print(pagador);

        break;
    }
  }

  int _radioValueDevedor = -1;
  String devedorChange = '';
  void _devedorChange(int value) {
    setState(() {
      _radioValueDevedor = value;
    });

    switch (_radioValueDevedor) {
      case 0:
        devedorChange =
            Provider.of<ItemProvider>(context, listen: false).user1();
        print(devedorChange);

        break;
      case 1:
        devedorChange =
            Provider.of<ItemProvider>(context, listen: false).user2();
        print(devedorChange);

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ItemProvider itemRaw = Provider.of(context);
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text('Novo Item', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Container(
          width: 800,
          child: Column(
            children: [
              TextField(
                controller: itemController,
                decoration: InputDecoration(
                  labelText: "Descrição do item",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                controller: valorController,
                decoration: InputDecoration(
                  labelText: "Valor R\$",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Text(
                    'Pagador:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValuePagador,
                        onChanged: _pagadorChange,
                      ),
                      Text(itemRaw.user1()),
                      Radio(
                        value: 1,
                        groupValue: _radioValuePagador,
                        onChanged: _pagadorChange,
                      ),
                      Text(itemRaw.user2()),
                    ],
                  ),
                  Divider(),
                  Text('Devedor:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValueDevedor,
                        onChanged: _devedorChange,
                      ),
                      Text(itemRaw.user1()),
                      Radio(
                        value: 1,
                        groupValue: _radioValueDevedor,
                        onChanged: _devedorChange,
                      ),
                      Text(itemRaw.user2()),
                    ],
                  ),
                  // Divider(),
                  // Text(
                  //   'Pagamento integral?',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Radio(
                  //       value: 0,
                  //       groupValue: null,
                  //       onChanged: null,
                  //     ),
                  //     Text('Não'),
                  //     Radio(
                  //       value: 1,
                  //       groupValue: null,
                  //       onChanged: null,
                  //     ),
                  //     Text('Sim'),
                  //   ],
                  // ),
                  // Divider(),
                  // Text(
                  //   'Tipo:',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Radio(
                  //         value: 0,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Outros'),
                  //       Radio(
                  //         value: 1,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Casa'),
                  //       Radio(
                  //         value: 2,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Educação'),
                  //       Radio(
                  //         value: 3,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Eletronicos'),
                  //       Radio(
                  //         value: 4,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Lazer'),
                  //       Radio(
                  //         value: 5,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Restaurante'),
                  //       Radio(
                  //         value: 6,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Saúde'),
                  //       Radio(
                  //         value: 7,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Supermercado'),
                  //       Radio(
                  //         value: 8,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Transporte'),
                  //       Radio(
                  //         value: 9,
                  //         groupValue: null,
                  //         onChanged: null,
                  //       ),
                  //       Text('Viagem'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          FlatButton(
            onPressed: () {
              if (itemController.text.isEmpty) {
                return;
              }
              if (valorController.text.isEmpty) {
                return;
              }
              if (_radioValuePagador < 0) {
                return;
              }
              if (_radioValueDevedor < 0) {
                return;
              }

              itemRaw.addItem(
                item: itemController.text,
                valor: double.parse(valorController.text),
                pagador: pagador,
                devedor: devedorChange,
              );

              Navigator.pop(context);
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
