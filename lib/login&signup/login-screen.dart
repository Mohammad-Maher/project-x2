import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/log_in_as_admin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/sign_up.dart';
import 'forgot-password.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var isAdmin = false;
  void validate() {
    if (formkey.currentState!.validate()) {
      Navigator.of(context).pushNamed("/home", arguments: isAdmin);
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return Home();
      // }));
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: SizedBox(
        height: 700,
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/fast-fashion.jpg"),
                  fit: BoxFit.cover)),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fillColor: Colors.grey[500]!.withOpacity(0.5),
                    prefixIcon: Icon(FontAwesomeIcons.envelope),
                    hintText: 'Email',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required *"),
                    EmailValidator(errorText: "Not A vaild Email "),
                  ]),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: Icon(FontAwesomeIcons.lock),
                      hintText: 'Password',
                      fillColor: Colors.grey[500]!.withOpacity(0.5),
                    ),
                    validator: MinLengthValidator(8,
                        errorText: "should be at least 8 caracter")),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgotPassword();
                    }));
                  },
                  child: Text('Forgot Password',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white70)),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Signup();
                    }));
                  },
                  child: Container(
                    child: Text('Create New Account',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.white70)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Loginasadmin();
                    }));
                  },
                  child: Text('Log In As Admain',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white70)),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: validate,
                    child: Text("Log In"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
