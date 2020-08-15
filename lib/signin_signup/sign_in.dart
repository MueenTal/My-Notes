import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/pages/main_screen.dart';
import 'package:firebaseusers/signin_signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'forget_password.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.red[200], Colors.red[100]])),
          ),
          ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 5,
                        left: MediaQuery.of(context).size.width / 8,
                        right: MediaQuery.of(context).size.width / 8,
                        bottom: MediaQuery.of(context).size.height / 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(38),
                          bottomRight: Radius.circular(38)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pacifico'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                hintText: 'Please Enter your Email',
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue, width: 3),
                                  borderRadius: BorderRadius.circular((25)),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Please Enter your Password',
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue, width: 3),
                                  borderRadius: BorderRadius.circular((25)),
                                ),
                              )),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 15, bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Do you forget password ? ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, bottom: 8),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.blue[300],
                                          Colors.blue[300],
                                        ])),
                                child: FlatButton(
                                  child: Text(
                                    "Sign Up  ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUp(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 8, bottom: 8),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.blue[100],
                                          Colors.blue[100],
                                        ])),
                                child: FlatButton(
                                  child: Text(
                                    "Sign In  ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  onPressed: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.red,
                                      Colors.red,
                                    ])),
                            child: FlatButton(
                              splashColor: Colors.blueAccent,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'pacifico'),
                              ),
                              onPressed: () async {
                                if (_email.text.isEmpty ||
                                    _password.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "You must enter email and password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  try {
                                    var user = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _email.text,
                                            password: _password.text);
                                    if (user.user.isEmailVerified) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainScreen()));
                                    } else {
                                      await user.user.sendEmailVerification();
                                      Fluttertoast.showToast(
                                          msg:
                                              "Email is not verified ... please check your email",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    if (e
                                        .toString()
                                        .contains("ERROR_USER_NOT_FOUND"))
                                      Fluttertoast.showToast(
                                          msg: "User is not found",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    if (e
                                        .toString()
                                        .contains("ERROR_WRONG_PASSWORD"))
                                      Fluttertoast.showToast(
                                          msg: "Password is wrong",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
