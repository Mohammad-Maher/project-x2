import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/categorise.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/background-image.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import '../models/product_layout.dart';
import 'drawer.dart';

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
  List<List<ProductLayout>> storeContent = [
    [
      ProductLayout(
          'zara shirt',
          'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
          15.99,
          50.99,
          true,
          0),
      ProductLayout(
          'zara shirt',
          'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
          15.99,
          65.99,
          true,
          0),
      ProductLayout(
          'zara shirt',
          'https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0005_2.jpg?v=1634377223',
          15.99,
          55,
          true,
          0),
      ProductLayout(
          'zara shirt',
          'https://images.asos-media.com/products/new-look-long-sleeve-muscle-fit-oxford-shirt-in-khaki/200545390-1-khaki?\$n_480w\$&wid=476&fit=constrain',
          15.99,
          25.5,
          true,
          0),
      ProductLayout(
          'zara shirt',
          'https://assetscdn1.paytm.com/images/catalog/product/A/AP/APPSUR-T-MEN-COPATE2956072B022AAD/1586406885432_0..jpg?imwidth=282&impolicy=hq',
          15.99,
          55,
          true,
          0),
    ],
    [
      ProductLayout(
          'adidas white shirt',
          'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
          15.99,
          50,
          true,
          0),
      ProductLayout(
          'adidas red shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/3bcfb6bd1282449abcbaad6b00dc6d9b_9366/adicolor-classics-trefoil-t-shirt-%E2%80%93-grosse-grossen.jpg',
          99.99,
          209.99,
          true,
          0),
      ProductLayout(
          'pink adidas shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/0f9ade5e7b154709b709ad0b008cb136_9366/adicolor-classics-trefoil-t-shirt.jpg',
          99.99,
          209.99,
          true,
          0),
      ProductLayout(
          'grey adidas shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/35e687afff864631ac4fad0b0082553d_9366/adicolor-classics-trefoil-tee.jpg',
          99.99,
          220.99,
          true,
          0),
    ],
    [
      ProductLayout(
          'zara shirt',
          'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
          15.99,
          29.99,
          true,
          0),
      ProductLayout(
          'zara shirt',
          'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
          15.99,
          99.99,
          true,
          0),
    ],
    [
      ProductLayout(
          'Red Nike Shirt',
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/73507444-25f7-4be0-ad71-45576c5bcf89/sportswear-mens-t-shirt-MK2TR1.png',
          15.99,
          29.99,
          true,
          0),
      ProductLayout(
        'zara shirt',
        'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
        15.99,
        29.99,
        true,
        0,
      )
    ],
  ];

  @override
  Widget build(BuildContext context) {
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
            fit: BoxFit.cover
          )
        ),
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
                          padding: EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                          child: Text(
                              AppLocalizations.of(context)!
                                      .translate('NEW_ARRIVALS') ??
                                  '',
                              style: TextStyle(
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
                                                style: TextStyle(fontSize: 14),
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
                                          height: (MediaQuery.of(context).size.width /
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
                            child: Image.network(
                                'https://images.unsplash.com/photo-1607083206325-caf1edba7a0f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1477&q=80'),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   image: AssetImage('assets/images/friday.jpg'),
                            // ),
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
