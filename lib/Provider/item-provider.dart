import 'package:divide_comigo/Model/item-model.dart';
import 'package:divide_comigo/data/item-data.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider with ChangeNotifier {
  List<ItemModel> _itemMocados = itemDATA;

  List<ItemModel> get item => [..._itemMocados];

  void adicionarItem(ItemModel newItem) {
    _itemMocados.add(newItem);
    notifyListeners(); //esse código avisa que os dados foram alterados
  }
}
