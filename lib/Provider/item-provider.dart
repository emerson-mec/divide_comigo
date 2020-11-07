import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/data/item-data.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider with ChangeNotifier {
  List<ItemModel> _itemMocados = itemDATA;

  get item => [..._itemMocados];

  removeItem(int index) {
    _itemMocados.removeAt(index);
    notifyListeners();
  }

  void apagarTudo() {
    _itemMocados.clear();
    notifyListeners();
  }

  void addItem({
    String data = '',
    String item,
    String devedor = '',
    String pagador = '',
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
