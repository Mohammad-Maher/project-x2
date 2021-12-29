import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './product_detail.dart';
import './models/product_layout.dart';

enum filterOption { favourites, all }

class Categorise extends StatefulWidget {
  static const routeName = '/categorise';
  @override
  _CategoriseState createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
  var showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    final storesContentArg =
    ModalRoute.of(context)!.settings.arguments as List<ProductLayout>;
    final justFavContent = storesContentArg
        .where((element) => element.isFavourite == true)
        .map((e) {
      return e;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (filterOption selected) {
              setState(() {
                if (selected == filterOption.favourites) {
                  showOnlyFav = true;
                } else
                  showOnlyFav = false;
              });
            },
            itemBuilder: (_) {
              //this item builder will show ur options when u press the menu button
              return [
                PopupMenuItem(
                  child: Text(
                    'only favourites',
                    style: TextStyle(),
                  ),
                  value: filterOption
                      .favourites, //or u can make the value zero and just remember zero means favourites and 1 means show all
                ),
                PopupMenuItem(
                  child: Text('show all'),
                  value: filterOption.all,
                )
              ];
            },
            icon: Icon(Icons.more_horiz),
            iconSize: 30.7,
          )
        ],
        // title: Text('SeamlesStyle'),
        title: Text('Stores'),
      ),
      body: SafeArea(
          child: Container(
            child: showOnlyFav
                ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Products.routname,
                        arguments: justFavContent[index],
                      );
                      /////////////////// change this to a navigator dont forget
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // if (justFavContent[index].isFavourite)
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            fit: BoxFit.fitHeight,
                            // imageUrl: imgList[index],
                            imageUrl: justFavContent[index].img,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                          ),
                        ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.shopping_bag_outlined,
                          //   color: Theme.of(context).primaryColorLight,
                          // ),
                          trailing: Text(
                            justFavContent[index].price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          title: Text(
                            justFavContent[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              // itemCount: imgList.length,
              itemCount: justFavContent.length,
            )

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Products.routname,
                        arguments: storesContentArg[index],
                      );
                      /////////////////// change this to a navigator dont forget
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // if (storesContentArg[index].isFavourite)
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            fit: BoxFit.fitHeight,
                            // imageUrl: imgList[index],
                            imageUrl: storesContentArg[index].img,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                          ),
                        ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.shopping_bag_outlined,
                          //   color: Theme.of(context).primaryColorLight,
                          // ),
                          trailing: Text(
                            storesContentArg[index].price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          title: Text(
                            storesContentArg[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              // itemCount: imgList.length,
              itemCount: storesContentArg.length,
            ),
          )),
    );
  }
}