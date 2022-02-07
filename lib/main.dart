import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/login-screen.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/sign_up.dart';
import './admin.dart';
import 'package:flutter_ecommerce_ui_kit/providers/cart_provider.dart';
import './providers/store_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:flutter_ecommerce_ui_kit/cart.dart';
import 'package:flutter_ecommerce_ui_kit/categorise.dart';
import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import 'package:provider/provider.dart';
import './edit_products.dart';
import './cart.dart';
import './checkout.dart';
import 'login&signup/forgot-password.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock()),
      ChangeNotifierProvider<Cart>.value(value: Cart()),
      ChangeNotifierProvider<StoreContent>.value(value: StoreContent()),
    ],
    child: MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      // locale: locale,
      debugShowCheckedModeBanner: false,

      theme: FlexColorScheme.light(
        fontFamily: 'Lato',
        scheme: FlexScheme.gold,
        // Use comfortable on desktops instead of compact, devices use default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        fontFamily: 'Lato',
        scheme: FlexScheme.shark,
        // Use comfortable on desktops instead of compact, devices use default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      themeMode: ThemeMode.light,
      // theme: ThemeData(
      //     primaryColor: Colors.purple,
      //     accentColor: Colors.amber,
      //     fontFamily: locale.languageCode == 'ar' ? 'Dubai' : 'Lato'),

      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginScreen(),
        '/forgot': (BuildContext context) => ForgotPassword(),
        '/signup': (BuildContext context) => Signup(),
        '/home': (BuildContext context) => Home(),
        Products.routname: (BuildContext context) => Products(),
        Admin.routename: (BuildContext context) => Admin(),
        EditProducts.routename: (BuildContext context) => EditProducts(),
        Categorise.routeName: (BuildContext context) => Categorise(),
        CartScreen.routeNeme: (BuildContext context) => CartScreen(),
        Checkout.routeName: (BuildContext context) => Checkout(),
      },
    ),
  ));
}
