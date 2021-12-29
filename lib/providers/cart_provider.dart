import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/product_layout.dart';

class Cart with ChangeNotifier {
  // Map<String, ProductLayout>
  List<ProductLayout> _items =
      []; // start with an empty map to not get errors and stuff

  // Map<String, ProductLayout>
  List<ProductLayout> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  void addItem(String name, String image, double price, int quantity,
      double prev, bool isFav) {
    quantity <= 1
        ? _items.add(ProductLayout(name, image, price, prev, isFav, 1))
        : _items // i may delete this condition not yet sure though
            .add(ProductLayout(name, image, price, prev, isFav, quantity++));
  }

  void clearItems() {
    _items = [];
    notifyListeners();
  }

  void removeItem(String id) {
    //the id will be the item name at this point
    // _items.removeWhere((element) => element.name == id);
    var x = _items.firstWhere((element) => element.name == id);
    _items.remove(x);

    notifyListeners();
  }
}
