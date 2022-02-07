import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/models/product_layout.dart';
import 'providers/cart_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import './models/product_layout.dart';

enum ClothesSize { s, m, l, xl, xxl }

class Products extends StatefulWidget {
  static const routname = '/products';

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var numberOfPresses = 0;
  var sizeChosen = 'M';
  List sizes = <String>['S', 'M', 'L', 'XL '];
  // var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final cartInfo = Provider.of<Cart>(context);
    final itemContent =
        ModalRoute.of(context)!.settings.arguments as ProductLayout;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: Hero(
                  tag: itemContent.img,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: itemContent.img.toString(),
                    // placeholder: (context, url) =>
                    //     Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        new Icon(Icons.error_sharp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      // alignment: Alignment(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          itemContent.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  itemContent.price.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(itemContent.prevPrice.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                child: Text(
                                  'Pick A Size',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                width: 80,
                              ),
                              DropdownButton(
                                value: sizeChosen,
                                icon: Icon(Icons.arrow_circle_down_sharp),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    sizeChosen = newValue!;
                                  });
                                },
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                                underline: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 2,
                                  color: Colors.orangeAccent,
                                ),
                                // items: sizes.map<DropdownMenuItem<String>>((String value) {
                                //   return DropdownMenuItem<String>(
                                //     value: value,
                                //     child: Text(value),
                                //   );
                                // }).toList(),
                                items: <String>[
                                  'S',
                                  'M',
                                  'L',
                                  'XL '
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              // TextButton(
                              //   onPressed: () {
                              //     cartInfo.addItem(
                              //         itemContent.name,
                              //         itemContent.img,
                              //         itemContent.price,
                              //         itemContent.quantity,
                              //         itemContent.isFavourite);
                              //   },
                              //   child: Text('Add to Cart'),
                              // )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemContent.isFavourite =
                                          !itemContent.isFavourite;
                                    });
                                  },
                                  icon: Icon(
                                    // _isFavourite
                                    itemContent.isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.pink,
                                  ))
                              // RatingStars(
                              //   // onValueChanged: ,
                              //   value: 5,
                              //   starSize: 16,
                              //   valueLabelColor:
                              //       Theme.of(context).secondaryHeaderColor,
                              //   starColor: Colors.yellow,
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  // itemContent.quantity++;
                                  numberOfPresses++;
                                });

                                cartInfo.addItem(
                                    itemContent.name,
                                    itemContent.img,
                                    itemContent.price,
                                    itemContent.quantity,
                                    itemContent.prevPrice,
                                    itemContent.isFavourite);
                              },
                              child: Text('Add to Cart'),
                            ),
                            // Text(itemContent.quantity.toString())
                            Text(numberOfPresses.toString())
                          ],
                        ),
                        Container(
                            alignment: Alignment(
                                -1.0, 0), //this means were on the left
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 2),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                            alignment: Alignment(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'lorem Ipsum is the single greatest threat. We are not - we are not keeping up with other websites. Lorem Ipsum best not make any more threats to your website. It will be met with fire and fury like the world has never seen. Does everybody know that pig named Lorem Ipsum? An ‘extremely credible source’ has called my office and told me that Barack Obama’s placeholder text is a fraud.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
