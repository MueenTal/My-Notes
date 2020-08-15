import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/signin_signup/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _name = TextEditingController();
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
                          "Register",
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
                              controller: _name,
                              decoration: InputDecoration(
                                hintText: 'Please Enter your Name',
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.assignment_ind),
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
                                          Colors.blue[100],
                                          Colors.blue[100],
                                        ])),
                                child: FlatButton(
                                  child: Text(
                                    "Sign Up  ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  onPressed: null,
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
                                          Colors.blue[300],
                                          Colors.blue[300],
                                        ])),
                                child: FlatButton(
                                  child: Text(
                                    "Sign In  ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                    );
                                  },
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
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'pacifico'),
                              ),
                              onPressed: () async {
                                if (_name.text.isEmpty ||
                                    _email.text.isEmpty ||
                                    _password.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "You must enter username and password and Full Name",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (_password.text.length < 6) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Password length must be more than 6 characters",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  AuthResult user;
                                  try {
                                    user = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _email.text,
                                            password: _password.text);
                                  } catch (e) {
                                    if (e
                                        .toString()
                                        .contains("ERROR_INVALID_EMAIL"))
                                      Fluttertoast.showToast(
                                          msg: "Email is invalid",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    if (e
                                        .toString()
                                        .contains("ERROR_EMAIL_ALREADY_IN_USE"))
                                      Fluttertoast.showToast(
                                          msg: "Email is already registered",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    print(e);
                                  } finally {
                                    if (user != null) {
                                      UserUpdateInfo u = UserUpdateInfo();
                                      u.displayName = _name.text;
                                      u.photoUrl =
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Gnome-stock_person.svg/1200px-Gnome-stock_person.svg.png';

                                      await user.user.updateProfile(u);
                                      await user.user.sendEmailVerification();

                                      Fluttertoast.showToast(
                                          msg:
                                              "we sent the email , plese check your email ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    }
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
