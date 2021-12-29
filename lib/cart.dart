import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import './providers/cart_provider.dart';
import './checkout.dart';

class CartScreen extends StatefulWidget {
  static const routeNeme = '/cart';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<dynamic, dynamic>> products = [
    // {
    //   'name': 'IPhone',
    //   'rating': 3.0,
    //   'image':
    //       'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'price': '200'
    // },
    // {
    //   'name': 'IPhone X 2',
    //   'rating': 3.0,
    //   'image':
    //       'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'price': '200'
    // },
    // {
    //   'name': 'IPhone 11',
    //   'rating': 4.0,
    //   'image':
    //       'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'price': '200'
    // },
  ];

  @override
  Widget build(BuildContext context) {
    final cartinfo = Provider.of<Cart>(context);
    var total = cartinfo.totalPrice;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: [
            IconButton(
                tooltip: 'Clear Cart',
                onPressed: () {
                  cartinfo.clearItems();
                },
                icon: Icon(Icons.clear))
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Container(
                  child: Text(
                      cartinfo.items.length.toString() + " ITEMS IN YOUR CART",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: cartinfo.items.length,
                  itemBuilder: (context, index) {
                    // final item = cartinfo.items[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key(UniqueKey().toString()),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        cartinfo.removeItem(cartinfo.items[index].name);
                        // cartinfo.items[index].quantity--;

                        setState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text(cartinfo.items[index].name + " dismissed"),
                            duration: Duration(seconds: 1)));

                        // Remove the item from the data source.
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                      confirmDismiss: (direction) {
                        return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text(
                                      'Are you sure you want to delete the order'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        },
                                        child: Text('No')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop(true);
                                        },
                                        child: Text('Yes'))
                                  ],
                                ));
                      },

                      background: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration:
                            BoxDecoration(color: Theme.of(context).errorColor),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      child: InkWell(
                        // onTap: () {
                        //   print('Card tapped.');
                        // },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: ListTile(
                                trailing:
                                    Text('\$ ${cartinfo.items[index].price}'),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor),
                                    child: SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        imageUrl: cartinfo.items[index].img,
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.add_task),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  cartinfo.items[index].name,
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, bottom: 1),
                                          child: Text('in stock',
                                              style: TextStyle(
                                                // color: Theme.of(context)
                                                //     .accentColor,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "TOTAL",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )),
                        Text('${(total + 2).toStringAsFixed(2)} \$',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Items Price",
                                style: TextStyle(fontSize: 14))),
                        Text(total.toStringAsFixed(2) + '\$',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        // Expanded(
                        //     child: Text("Shipping",
                        //         style: TextStyle(fontSize: 14))),
                        // Text(
                        //   "\$2.00",
                        //   style: TextStyle(fontSize: 14, color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Tax", style: TextStyle(fontSize: 14))),
                        Text("\$2.00",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 50, bottom: 10),
              child: ButtonTheme(
                buttonColor: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (cartinfo.items.length == 0) {
                      return;
                    } else
                      Navigator.of(context).pushNamed(Checkout.routeName);
                  },
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
