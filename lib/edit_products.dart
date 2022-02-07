import 'package:flutter/material.dart';
import 'providers/store_provider.dart';
import 'package:provider/provider.dart';
import 'models/product_layout.dart';

enum sNames { zara, adidas, hM, nike }

class EditProducts extends StatefulWidget {
  static const routename = '/edit';

  @override
  State<EditProducts> createState() => _EditProductsState();
}

class _EditProductsState extends State<EditProducts> {
  final _formKey = GlobalKey<FormState>();
  // final controller = TextEditingController();
  // final focus = FocusNode();
  int index = 0;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };
  // var _editedProduct = ProductLayout('shirttt', 'img', 88, 111, false, 0);
  var _editedProduct = ProductLayout(
      'shirttt',
      'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
      88,
      111,
      false,
      0);

  void _saveform() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<StoreContent>(context, listen: false).addItem(
      index,
      _editedProduct.name,
      _editedProduct.img,
      _editedProduct.price,
      _editedProduct.prevPrice,
    );
    Navigator.of(context).pop();
    // _formKey.currentState!.validate();
    // Provider.of<StoreContent>(context).addItem(
    //     index,
    //     _editedProduct.name,
    //     _editedProduct.img,
    //     _editedProduct.price,
    //     0,
    //     _editedProduct.prevPrice,
    //     false);
  }

  @override
  Widget build(BuildContext context) {
    // final itemsList = Provider.of<StoreContent>(context).storeContent;
    final itemsAdd = Provider.of<StoreContent>(context).addItem;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.done),
        // ),
        appBar: AppBar(
          title: Text('Edit Page'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  initialValue: _initValues['shop'],
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'please enter a title';
                  //   }
                  //   return null;
                  // },

                  autocorrect: true,
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                      labelText: 'Shop',
                      errorStyle:
                          TextStyle(color: Theme.of(context).errorColor)),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    if (value == null) {
                      index = 0;
                    } else if (value == 'zara') {
                      index = 0;
                    } else if (value == 'adidas') {
                      index = 1;
                    } else if (value == 'hm') {
                      index = 2;
                    } else if (value == 'nike' || value == 'Nike') {
                      index = 3;
                    } else
                      index = int.parse(value);
                  },
                ),
                TextFormField(
                  initialValue: _initValues['title'],
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'please enter a title';
                  //   }
                  //   return null;
                  // },

                  autocorrect: true,
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                      labelText: 'title',
                      errorStyle:
                          TextStyle(color: Theme.of(context).errorColor)),
                  textInputAction: TextInputAction.next,

                  onSaved: (value) {
                    _editedProduct = ProductLayout(
                        value.toString(),
                        _editedProduct.img,
                        _editedProduct.price,
                        _editedProduct.prevPrice,
                        false,
                        0);

                    print(_editedProduct.name);
                  },
                ),
                TextFormField(
                  initialValue: _initValues['image'],
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'please enter a title';
                  //   }
                  //   return null;
                  // },
                  // focusNode: focus,
                  // controller: controller,
                  keyboardType: TextInputType.url,
                  autocorrect: false,
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                      labelText: 'image URL',
                      errorStyle:
                          TextStyle(color: Theme.of(context).errorColor)),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _editedProduct = ProductLayout(
                        _editedProduct.name,
                        value.toString(),
                        _editedProduct.price,
                        _editedProduct.prevPrice,
                        false,
                        0);
                  },
                ),
                TextFormField(
                  initialValue: _initValues['price'],
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'please enter a title';
                  //   }
                  //   return null;
                  // },

                  autocorrect: true,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                      labelText: 'price',
                      errorStyle:
                          TextStyle(color: Theme.of(context).errorColor)),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _editedProduct = ProductLayout(
                        _editedProduct.name,
                        _editedProduct.img,
                        value == null ? 101 : double.parse(value),
                        _editedProduct.prevPrice,
                        false,
                        0);
                    print(_editedProduct);
                  },
                ),
                TextFormField(
                  initialValue: _initValues['previuos price'],
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'please enter a title';
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.number,
                  autocorrect: true,
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                      labelText: 'previous price',
                      errorStyle:
                          TextStyle(color: Theme.of(context).errorColor)),
                  textInputAction: TextInputAction.done,
                  onSaved: (value) {
                    _editedProduct = ProductLayout(
                        _editedProduct.name,
                        _editedProduct.img,
                        _editedProduct.price,
                        value == null ? 404 : double.parse(value),
                        false,
                        0);
                  },
                  onFieldSubmitted: (_) {
                    _saveform();
                    // itemsAdd(
                    //     index,
                    //     _editedProduct.name,
                    //     _editedProduct.img,
                    //     _editedProduct.price,
                    //     0,
                    //     _editedProduct.prevPrice,
                    //     false);
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _saveform();
          },
          child: Icon(Icons.done),
        ),
      ),
    );
  }
}