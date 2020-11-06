import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum CategoriaItem {
  Outros,
  Casa,
  Educacao,
  Eletronicos,
  Lazer,
  Restaurante,
  Saude,
  Supermercado,
  Transporte,
  Vestuario,
  Viagem,
}

class ItemModel extends ChangeNotifier {
  String item;
  String data;
  CategoriaItem tipo;
  double valor;
  String pagador;
  String devedor;

  ItemModel({
    this.item,
    this.data,
    this.tipo = CategoriaItem.Outros,
    this.valor,
    this.pagador,
    this.devedor,
  });

  String get tipoAsText {
    switch (tipo) {
      case CategoriaItem.Outros:
        return 'Outros';
      case CategoriaItem.Casa:
        return 'Casa';
      case CategoriaItem.Educacao:
        return 'Educação';
      case CategoriaItem.Eletronicos:
        return 'Eletronicos';
      case CategoriaItem.Lazer:
        return 'Lazer';
      case CategoriaItem.Restaurante:
        return 'Restaurante';
      case CategoriaItem.Saude:
        return 'Saúde';
      case CategoriaItem.Supermercado:
        return 'Supermercado';
      case CategoriaItem.Transporte:
        return 'Transporte';
      case CategoriaItem.Viagem:
        return 'Viagem';
      default:
        return 'Desconhecida';
    }
  }

  Icon get tipoAsIcon {
    switch (tipo) {
      case CategoriaItem.Outros:
        return Icon(Icons.help_outlined);
      case CategoriaItem.Casa:
        return Icon(Icons.home);
      case CategoriaItem.Educacao:
        return Icon(Icons.book);
      case CategoriaItem.Eletronicos:
        return Icon(Icons.electrical_services_sharp);
      case CategoriaItem.Lazer:
        return Icon(Icons.wb_sunny_rounded);
      case CategoriaItem.Restaurante:
        return Icon(Icons.local_pizza_rounded);
      case CategoriaItem.Saude:
        return Icon(Icons.healing_sharp);
      case CategoriaItem.Supermercado:
        return Icon(Icons.food_bank_rounded);
      case CategoriaItem.Transporte:
        return Icon(Icons.bus_alert);
      case CategoriaItem.Viagem:
        return Icon(Icons.wallet_travel_outlined);
      default:
        return Icon(Icons.help_outline_sharp);
    }
  }
}
