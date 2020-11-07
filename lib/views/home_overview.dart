//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/Provider/item-provider.dart';
import 'package:divide_comigo/widgets/add-item.dart';
import 'package:divide_comigo/widgets/delete-tudo.dart';
import 'package:divide_comigo/widgets/item-lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatelessWidget {
  //final db = FirebaseFirestore.instance.collection('compras');

  @override
  Widget build(BuildContext context) {
    ItemProvider itemRaw = Provider.of(context);
    List<ItemModel> itemList = itemRaw.item;

    String primeiroUser = "Emerson";
    String segundoUser = "Larissa";

    double totalMes = itemList
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);

    double totalFistUser = itemList
        .where((element) => element.pagador == primeiroUser)
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);
    double totalSecondUser = itemList
        .where((element) => element.pagador == segundoUser)
        .map((e) => e.valor)
        .reduce((total, acumulador) => total + acumulador);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                        ? "$segundoUser deve:"
                        : "$primeiroUser deve:",
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
                          'Total de gastos $primeiroUser',
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
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      return showDialog(context: context, child: AddItem());
                    },
                    child: Text(
                      'Adicionar item',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      return showDialog(context: context, child: ApagarTudo());

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
        ));
  }
}
