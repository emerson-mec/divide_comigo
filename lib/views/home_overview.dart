import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/Provider/item-provider.dart';
import 'package:divide_comigo/widgets/item-lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatelessWidget {
  final db = FirebaseFirestore.instance.collection('compras');

  @override
  Widget build(BuildContext context) {
    ItemProvider itemRaw = Provider.of(context);
    List<ItemModel> itemList = itemRaw.item;

    var totalMes = itemList
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);

    var totalFistUser = itemList
        .where((element) => element.pagador[0] == "Emerson")
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);
    var totalSecondUser = itemList
        .where((element) => element.pagador[0] == "Larissa")
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ////////// MENU TOP AZUL
          Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text('Gastos no mês'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8),
          ),
          //////////////// GASTOS MÊS
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
                        'Total de gastos no mês',
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
          Divider(),
          SizedBox(height: 15),
          Text('Itens'),

          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, i) => ChangeNotifierProvider.value(
                value: itemList[i],
                child: ItemList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
