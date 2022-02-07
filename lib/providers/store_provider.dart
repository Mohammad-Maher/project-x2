import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import '../models/product_layout.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StoreContent with ChangeNotifier {
  List<List<ProductLayout>> _storeContent = [
    [
      // ProductLayout(
      //     'zara buttons shirt',
      //     'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
      //     15.99,
      //     50.99,
      //     false,
      //     0),
      ProductLayout(
          'zara blue shirt',
          'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
          15.99,
          65.99,
          false,
          0),
      ProductLayout(
          'zara grey mens shirt',
          'https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0005_2.jpg?v=1634377223',
          15.99,
          55,
          false,
          0),
      ProductLayout(
          'zara green shirt',
          'https://images.asos-media.com/products/new-look-long-sleeve-muscle-fit-oxford-shirt-in-khaki/200545390-1-khaki?\$n_480w\$&wid=476&fit=constrain',
          15.99,
          25.5,
          false,
          0),
      ProductLayout(
          'zara check shirt',
          'https://assetscdn1.paytm.com/images/catalog/product/A/AP/APPSUR-T-MEN-COPATE2956072B022AAD/1586406885432_0..jpg?imwidth=282&impolicy=hq',
          15.99,
          55,
          false,
          0),
    ],
    [
      ProductLayout(
          'adidas white shirt',
          'https://rukminim1.flixcart.com/image/800/960/jn97frk0/t-shirt/7/b/p/m-ce1415white-adidas-original-imaf9zdfhjhhygef.jpeg?q=50',
          // 'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
          15.99,
          50,
          false,
          0),
      ProductLayout(
          'adidas red shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/3bcfb6bd1282449abcbaad6b00dc6d9b_9366/adicolor-classics-trefoil-t-shirt-%E2%80%93-grosse-grossen.jpg',
          99.99,
          209.99,
          false,
          0),
      ProductLayout(
          'pink adidas shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/0f9ade5e7b154709b709ad0b008cb136_9366/adicolor-classics-trefoil-t-shirt.jpg',
          99.99,
          209.99,
          false,
          0),
      ProductLayout(
          'grey adidas shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/35e687afff864631ac4fad0b0082553d_9366/adicolor-classics-trefoil-tee.jpg',
          99.99,
          220.99,
          false,
          0),
    ],
    [
      ProductLayout(
          'H&M bugs shirt',
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fbf%2Fcc%2Fbfccfdb9212f3eaaeaa672644343638d60813d02.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
          15.99,
          29.99,
          false,
          0),
      ProductLayout(
          'H&M black shirt',
          'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
          15.99,
          99.99,
          false,
          0),
    ],
    [
      ProductLayout(
          'Red Nike Shirt',
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/73507444-25f7-4be0-ad71-45576c5bcf89/sportswear-mens-t-shirt-MK2TR1.png',
          15.99,
          29.99,
          false,
          0),
      ProductLayout(
        'white nike shirt',
        'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
        15.99,
        29.99,
        false,
        0,
      )
    ],
  ];
   Future<void> fetchProducts() async {
    try {
      // var index = 0;
      final url =
          // 'https://store-68fb4-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';
          Uri.parse('https://flutter1-85096-default-rtdb.firebaseio.com/.json');
      final response = await http.get(url);
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<List<ProductLayout>> loadedProd = [[]];
      // final List<Map<String, dynamic>> loadedProd = [];
      // if (extractedData.isEmpty) {
      //   return;
      // }
      // for (var i = 0; i < extractedData.length; i++) {
      //   loadedProd[place].add(ProductLayout(
      //       extractedData[i]['name'],
      //       extractedData[i]['img'],
      //       extractedData[i]['price'],
      //       extractedData[i]['prevprice'],
      //       extractedData[i]['isfavourite'],
      //       extractedData[i]['quantity']));
      // }
      if (extractedData.isEmpty) {
        extractedData = {'name': 'oops:)))'};
        print('wassup');
      }
      for (var i = 0; i < 3; i++) {
        int place = 0;
        if (extractedData[i].length > 0) {
          extractedData[i].forEach((data) {
            //the key is product id and data is our product  data (اظن  )
            loadedProd[place].add(ProductLayout(
                data[place][i]['name'],
                data[place][i]['img'],
                data[place][i]['price'],
                data[place][i]['prevPrice'],
                data[place][i]['isFavourite'],
                data[place][i]['quantity']));
            place++;
            // index++;
          });
        }
      }

      _storeContent = loadedProd;

      notifyListeners();
    } catch (error) {
      print('dont tell me ik ');
      throw error;
    }
  }
  List<List<ProductLayout>> get storeContent {
    return [..._storeContent];
  }

  void addItem(
    int place,
    String name,
    String image,
    double price,
    double prev,
  ) {
    var url5 = Uri.parse(
        "https://flutter1-85096-default-rtdb.firebaseio.com/$place.json");
    http
        .post(url5,
            body: json.encode({
              "name": name,
              "price": price,
              "prevprice": prev,
              "isfavourite": false,
              "quantity": 1,
              "img": image,
            }))
        .then((url5) {
      jsonDecode(url5.body);

      storeContent[place]
          .add(ProductLayout(name, image, price, prev, false, 0));
      notifyListeners();
    });

    //notifyListeners();

    //  storeContent .add(ProductLayout(name, image, price, prev, isFav, quantity++));
  }

  // void addItem(int place, ProductLayout items) {
  //   storeContent[place].add(items);
  //   notifyListeners();
  // }
 

  void delete(int place, String name) async {
    var url20 = Uri.parse(
        "https://flutter1-85096-default-rtdb.firebaseio.com/$place.json");
    //final prodindex =
    // storeContent.indexWhere((element) => element.name == place);
    storeContent[place].removeWhere((element) => element.name == name);
    var proditem = storeContent[place];
    //storeContent[place].removeAt(prodindex);
    storeContent.removeAt(place);
    notifyListeners();
    //storeContent[place].removeWhere((element) => element.name == id);
    var res = await http.delete(url20);
    if (res.statusCode >= 400) {
      storeContent.insert(place, proditem);
      // notifyListeners();
    }

    // proditem = null;
    http.delete(url20);  //important
    notifyListeners();
  }
}