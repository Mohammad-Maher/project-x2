import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/screens.dart';
import 'package:flutter_ecommerce_ui_kit/providers/cart_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:flutter_ecommerce_ui_kit/cart.dart';
import 'package:flutter_ecommerce_ui_kit/categorise.dart';
import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import 'package:provider/provider.dart';
import './cart.dart';
import './checkout.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock()),
      ChangeNotifierProvider<Cart>.value(value: Cart()),
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
        '/create': (BuildContext context) => CreateNewAccount(),
        '/home': (BuildContext context) => Home(),
        Products.routname: (BuildContext context) => Products(),
        Categorise.routeName: (BuildContext context) => Categorise(),
        CartScreen.routeNeme: (BuildContext context) => CartScreen(),
        Checkout.routeName: (BuildContext context) => Checkout(),
      },
    ),
  ));
}
