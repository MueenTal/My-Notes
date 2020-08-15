import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPass = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _newPassCon = TextEditingController();

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
                          "Enter a new password ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _oldPass,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Please Enter old Password',
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key),
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
                              controller: _newPass,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Please Enter a new Password',
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key),
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
                              controller: _newPassCon,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Please Enter the password again',
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue, width: 3),
                                  borderRadius: BorderRadius.circular((25)),
                                ),
                              )),
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
                                "Change",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'pacifico'),
                              ),
                              onPressed: () async {
                                try {
                                  var user =
                                      await FirebaseAuth.instance.currentUser();
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: user.email,
                                          password: _oldPass.text);
                                  if (_newPass.text != _newPassCon.text) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "New password and new password confirmation does not match",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    await user.updatePassword(_newPass.text);
                                    Fluttertoast.showToast(
                                        msg: "Password changed successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  }
                                } catch (e) {
                                  if (e
                                      .toString()
                                      .contains("ERROR_WRONG_PASSWORD"))
                                    Fluttertoast.showToast(
                                        msg: "Old password is wrong",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
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
