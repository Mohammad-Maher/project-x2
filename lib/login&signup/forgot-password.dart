import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/login-screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
      }));
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text('Forgot Password',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                height: 1.5,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25.0),
            height: 700,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fast-fashion.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Container(
                          width: size.width * 0.8,
                          child: Text(
                              'Enter your email we will send instruction to reset your password',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.white70)),
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
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: validate,
                            child: Text("Send"),
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
