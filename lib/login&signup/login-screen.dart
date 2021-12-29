import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/home/home.dart';
// import 'package:flutter_ecommerce_ui_kit/signup/pallete.dart';
import './pallete.dart';
// import 'package:flutter_ecommerce_ui_kit/signup/screen/create-new-account.dart';
import 'create-new-account.dart';
// import 'package:flutter_ecommerce_ui_kit/signup/screen/forgot-password.dart';
import './forgot-password.dart';
// import 'package:flutter_ecommerce_ui_kit/signup/widgets.dart';
import './widgests.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/fast-fashion.jpg',
        ),
        Scaffold(
          floatingActionButton: SizedBox(
              height: 50,
              width: 150,
              child: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                label: Text('Log In'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'SeamlesStyle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    suffixtext:".com",
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    inputType: TextInputType.visiblePassword,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPassword();
                      }));
                    },
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CreateNewAccount();
                      }));
                    },
                    child: Container(
                      child: Text(
                        'Create New Account',
                        style: kBodyText,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kWhite))),
                    ),
                  ),
                  SizedBox(
                    height: 125,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
