import 'package:divide_comigo/Model/item-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemModel produto = Provider.of(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                    padding: const EdgeInsets.all(8.0),
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
                        Text(
                          produto.tipoAsText,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300),
                        ),
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Text(
                              '${produto.devedor[0]} deve R\$ ${produto.valor / 2}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          Text(
                            '${produto.pagador[0]} pagou\nR\$ ${produto.valor}',
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
                  Icon(Icons.more_vert_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
