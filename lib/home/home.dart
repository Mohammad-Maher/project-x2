import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/categorise.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
// import 'package:flutter_ecommerce_ui_kit/login&signup/background-image.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
// import '../models/product_layout.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';
import '../providers/store_provider.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _numOfStores = 4;

  final List<String> brandsList = [
    'https://images.unsplash.com/photo-1572615208281-3c9a9a9fb41c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1555274175-75f4056dfd05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1578983662508-41895226ebfb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=911&q=80',
    'https://images.unsplash.com/photo-1608541737042-87a12275d313?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1461&q=80',
    'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/73507444-25f7-4be0-ad71-45576c5bcf89/sportswear-mens-t-shirt-MK2TR1.png'
  ];
  // List<List<ProductLayout>> storeContent =
  String chooseDude(int place) {
    if (place == 0) {
      return 'zara';
    } else if (place == 1) {
      return 'adidas';
    } else if (place == 2) {
      return 'H&M';
    } else {
      return 'Nike';
    }
  }

  @override
  Widget build(BuildContext context) {
    final storeContent = Provider.of<StoreContent>(context).storeContent;
    return Scaffold(
      appBar: AppBar(
        title: Text('SeamlesStyle'),
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/rack-clothes-store.jpg"),
                fit: BoxFit.cover)),
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                      child: Text(
                          AppLocalizations.of(context)!
                                  .translate('NEW_ARRIVALS') ??
                              '',
                          style: TextStyle(
                            backgroundColor: Colors.white70,
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      height: 240.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: storeContent.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 140.0,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Products.routname,
                                          arguments: image[index]);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 160,
                                          child: Hero(
                                            tag: '$image',
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: image[index].img,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            image[index].name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          subtitle: Text(
                                              image[index].price.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    // Container(
                    //   child: Padding(
                    //     padding:
                    //         EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                    //     child: Image(
                    //       fit: BoxFit.cover,
                    //       image: AssetImage('assets/images/banner-1.png'),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                          child: Text('Choose Your Shop',
                              style: TextStyle(
                                  backgroundColor: Colors.white70,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 8.0, left: 8.0),
                        )
                      ],
                    ),
                    //////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), //havent made up my mind yet
                        crossAxisCount: 2,
                        padding: EdgeInsets.only(
                            top: 8, left: 6, right: 6, bottom: 12),
                        children: List.generate(_numOfStores, (index) {
                          return Container(
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                // hoverColor: Colors.amber,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      Categorise.routeName,
                                      arguments: storeContent[index]);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              70,
                                      width: double.infinity,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: brandsList[index],
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                    ),
                                    ListTile(
                                        title: Center(
                                      child: Text(
                                        chooseDude(index),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                        // child: Image.network(
                        //     'https://images.unsplash.com/photo-1607083206325-caf1edba7a0f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1477&q=80'),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/sale.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
                // Builds 1000 ListTiles
                childCount: 1,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
