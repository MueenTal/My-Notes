import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/pages/img_edit.dart';
import 'package:firebaseusers/signin_signup/sign_in.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseUser user;
  @override
  void initState() {
    // TODO: implement initState

    FirebaseAuth.instance.currentUser().then((value) {
      setState(() {
        user = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: Text("Sign out"),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            backgroundColor: Colors.pink,
            icon: Icon(Icons.label_outline)),
        appBar: AppBar(
            backgroundColor: Colors.red[200],
            centerTitle: true,
            title: Text(
              "My Profile",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifico',
                  color: Colors.white),
            )),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red[200], Colors.red[100]])),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(38),
                        topRight: Radius.circular(38)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileEdit()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2.5, color: Colors.red[200])
                                ],
                                color: Colors.red[50],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 4.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2.5, color: Colors.red[200])
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          height: MediaQuery.of(context).size.height / 14,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  child: Icon(
                                    Icons.assignment_ind,
                                    size:
                                        MediaQuery.of(context).size.height / 18,
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 14,
                                width: 2,
                                color: Colors.red[200],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 15,
                                child: Center(
                                  child: Text(
                                    user == null ? "" : user.displayName,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'pacifico'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2.5, color: Colors.red[200])
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          height: MediaQuery.of(context).size.height / 14,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  child: Icon(
                                    Icons.email,
                                    size:
                                        MediaQuery.of(context).size.height / 18,
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 14,
                                width: 2,
                                color: Colors.red[200],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    125 -
                                    (MediaQuery.of(context).size.height / 18),
                                child: Center(
                                  child: Text(
                                    user == null ? "" : user.email,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'pacifico'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 13,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(spreadRadius: 1.5, color: Colors.red[200]),
                      ], borderRadius: BorderRadius.all(Radius.circular(100))),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height / 12)),
                        child: CachedNetworkImage(
                            errorWidget: (context, url, error) => Icon(
                                  Icons.person,
                                  size: MediaQuery.of(context).size.height / 7,
                                  color: Colors.grey,
                                ),
                            fit: BoxFit.cover,
                            imageUrl: user == null
                                ? "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Gnome-stock_person.svg/1200px-Gnome-stock_person.svg.png"
                                : user.photoUrl),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
