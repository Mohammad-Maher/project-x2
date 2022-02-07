import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: Container(
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/hooks-hanging.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Color(0xff5663ff),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fillColor: Colors.grey[500]!.withOpacity(0.5),
                          prefixIcon: Icon(FontAwesomeIcons.user),
                          hintText: 'User',
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                        height: 20,
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
                        height: 20,
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            prefixIcon: Icon(FontAwesomeIcons.lock),
                            hintText: 'Confirm Password',
                            fillColor: Colors.grey[500]!.withOpacity(0.5),
                          ),
                          validator: MinLengthValidator(8,
                              errorText: "should be at least 8 caracter")),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: validate,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.white70)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.white70)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
