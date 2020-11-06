//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/Provider/item-provider.dart';
import 'package:divide_comigo/widgets/item-lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatelessWidget {
  //final db = FirebaseFirestore.instance.collection('compras');

  @override
  Widget build(BuildContext context) {
    ItemProvider itemRaw = Provider.of(context);
    List<ItemModel> itemList = itemRaw.item;

    double totalMes = itemList
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);

    double totalFistUser = itemList
        .where((element) => element.pagador == "Emerson")
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);
    double totalSecondUser = itemList
        .where((element) => element.pagador == "Larissa")
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);

    return Scaffold(
      backgroundColor: Colors.white,
      body: itemList.length > 0
          ? Column(
              children: [
                ////////// MENU TOP AZUL
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Color(0xFF00a9ea),
                    color: Colors.deepPurple,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        totalFistUser > totalSecondUser
                            ? "Larissa deve:"
                            : "Emerson deve:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'R\$ ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            totalFistUser > totalSecondUser
                                ? "${totalFistUser - totalSecondUser}"
                                : "${totalSecondUser - totalFistUser}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //////////////// GASTOS MÊS
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Text('Gastos no mês'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(150, 150, 150, 0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.monetization_on_outlined,
                              size: 30,
                              //color: Color(0xFF00a9ea),
                              color: Colors.deepPurple,
                            ),
                            Text(
                              'Total de gastos de ambos no mês',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'R\$ $totalMes',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(150, 150, 150, 0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person_pin_circle_outlined,
                              size: 30,
                              //color: Color(0xFF00a9ea),
                              color: Colors.deepPurple,
                            ),
                            Text(
                              'Total de gastos Emerson',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'R\$ $totalFistUser ',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(150, 150, 150, 0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person_pin_circle_outlined,
                              size: 30,
                              //color: Color(0xFF00a9ea),
                              color: Colors.deepPurple,
                            ),
                            Text(
                              'Total de gastos Larissa',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'R\$ $totalSecondUser',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),

                SizedBox(height: 15),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _adicionarItem(
                            context: context,
                            titulo: 'Novo Item',
                            itemRaw: itemRaw,
                            itemList: itemList,
                          );
                        },
                        child: Text(
                          'Adicionar item',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          itemRaw.apagarTudo();
                          //_apagarTudo(context);
                        },
                        child: Text(
                          'Apagar tudo',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, i) => ChangeNotifierProvider.value(
                      value: itemList[i],
                      child: ItemList(i),
                    ),
                  ),
                ),
              ],
            )
          : Center(child: Text('data')),
    );
  }
}

_apagarTudo(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Deseja apagar tudo?'),
      content: Text('Está ação é irreversível'),
      actions: <Widget>[
        FlatButton(
          onPressed: () => _apagarTudo(context),
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
    ),
  );
}

//
//
//
//
//
//
//
//
//
//
//
_adicionarItem({
  BuildContext context,
  String titulo,
  ItemProvider itemRaw,
  List<ItemModel> itemList,
}) {
  TextEditingController itemController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  int _radioValue = -1;
  String pagadorChange = '';

  void _pagadorChange(int value) {
    _radioValue = value;
    switch (_radioValue) {
      case 0:
        pagadorChange = 'Emerson';
        print(pagadorChange);
        break;
      case 1:
        pagadorChange = 'Larissa';
        print(pagadorChange);
        break;
    }
  }

  int _radioValueDevedor = -1;
  String devedorChange = '';

  void _devedorChange(int value) {
    _radioValueDevedor = value;
    switch (_radioValueDevedor) {
      case 0:
        devedorChange = 'Emerson';
        print(pagadorChange);
        break;
      case 1:
        devedorChange = 'Larissa';
        print(pagadorChange);
        break;
    }
  }

  return showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: AlertDialog(
        title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
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
                        groupValue: _radioValue,
                        onChanged: _pagadorChange,
                      ),
                      Text('Emerson'),
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _pagadorChange,
                      ),
                      Text('Larissa'),
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
                      Text('Emerson'),
                      Radio(
                        value: 1,
                        groupValue: _radioValueDevedor,
                        onChanged: _devedorChange,
                      ),
                      Text('Larissa'),
                    ],
                  ),
                  Divider(),
                  Text(
                    'Pagamento integral?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: null,
                        onChanged: null,
                      ),
                      Text('Não'),
                      Radio(
                        value: 1,
                        groupValue: null,
                        onChanged: null,
                      ),
                      Text('Sim'),
                    ],
                  ),
                  Divider(),
                  Text(
                    'Tipo:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 0,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Outros'),
                        Radio(
                          value: 1,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Casa'),
                        Radio(
                          value: 2,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Educação'),
                        Radio(
                          value: 3,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Eletronicos'),
                        Radio(
                          value: 4,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Lazer'),
                        Radio(
                          value: 5,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Restaurante'),
                        Radio(
                          value: 6,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Saúde'),
                        Radio(
                          value: 7,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Supermercado'),
                        Radio(
                          value: 8,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Transporte'),
                        Radio(
                          value: 9,
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Viagem'),
                      ],
                    ),
                  ),
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
              itemRaw.addItem(
                item: itemController.text,
                valor: double.tryParse(valorController.text) ?? 0.0,
                pagador: pagadorChange,
                devedor: devedorChange,
              );
              Navigator.pop(context);
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    ),
  );
}
