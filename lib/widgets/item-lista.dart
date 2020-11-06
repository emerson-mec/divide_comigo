import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/Provider/item-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  final int index;

  ItemList(this.index);

  @override
  Widget build(BuildContext context) {
    ItemProvider protudoRaw = Provider.of(context);
    ItemModel produto = Provider.of(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(150, 150, 150, 0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 10),
                    child: CircleAvatar(
                      maxRadius: 15,
                      // backgroundColor: Color(0xFF00a9ea),
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        produto.tipoAsIcon.icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            produto.item,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          produto.data,
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        ),
                        Text(
                          produto.tipoAsText,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              '${produto.devedor} deve R\$ ${produto.valor / 2}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                            '${produto.pagador} pagou\nR\$ ${produto.valor}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ////////////// OPÇÕES MENU
                  PopupMenuButton(
                    onSelected: (Options selectedValue) {
                      if (Options.Apagar == selectedValue) {
                        print('Clicou em apagar');
                        protudoRaw.removeItem(index);
                      } else if (Options.Alterar == selectedValue) {
                        print('Clicou em alterar');
                      }
                    },
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.edit_rounded),
                            Text('  Alterar'),
                          ],
                        ),
                        value: Options.Alterar,
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text('  Apagar'),
                          ],
                        ),
                        value: Options.Apagar,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Options {
  Alterar,
  Apagar,
}
