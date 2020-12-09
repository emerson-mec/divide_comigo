import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/data/item-data.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider with ChangeNotifier {
  List<ItemModel> _itemMocados = itemDATA;

  List<ItemModel> get item {
    return [..._itemMocados];
  }

  //////// RESOLVER PROBLEMA QUE QUEBRA A TELA SE NÃO HOUVER VALOR
  String quemDeve() {
    if (totalUser1() == 0 && totalUser2() == 0) {
      return 'Divide Comigo :)';
    } else if (totalUser1() > totalUser2()) {
      return user2() + ' deve'.toString();
    } else if (totalUser1() < totalUser2()) {
      return user1() + ' deve'.toString();
    }
    return '2 - Divide Comigo';
  }

  double totalUser1() {
    try {
      double total = _itemMocados
          .where((element) => element.pagador == user1())
          .map((e) => e.valor)
          .reduce((total, acumulador) => total + acumulador)
          .toDouble();
      return total;
    } catch (e) {
      return 0;
    }
  }

  double totalUser2() {
    try {
      double total = _itemMocados
          .where((element) => element.pagador == user2())
          .map((e) => e.valor)
          .reduce((total, acumulador) => total + acumulador)
          .toDouble();
      return total;
    } catch (e) {
      return 0;
    }
  }

  String user1() {
    return 'Emerson';
  }

  String user2() {
    return 'Larissa';
  }

  void apagarTudo() {
    _itemMocados.clear();
    notifyListeners();
  }

  removeItem(int index) {
    _itemMocados.removeAt(index);
    notifyListeners();
  }

  // double totalGastoMes() {
  //   if (_itemMocados == null ||
  //       _itemMocados.isEmpty ||
  //       _itemMocados == [] ||
  //       _itemMocados.length == 0) {
  //     return 0.0;
  //   } else {
  //     double total = _itemMocados
  //         .map((e) => e.valor)
  //         .reduce((total, acumulador) => total + acumulador);

  //     return total;
  //   }
  // }

  void addItem({
    String item,
    String devedor,
    String pagador,
    String data = '',
    double valor = 0.0,
    CategoriaItem tipo = CategoriaItem.Outros,
  }) {
    _itemMocados.add(
      ItemModel(
        item: item,
        devedor: devedor,
        pagador: pagador,
        data: data,
        valor: valor,
        tipo: tipo,
      ),
    );
    notifyListeners();
  }
}
