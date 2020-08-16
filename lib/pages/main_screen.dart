import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/pages/add.dart';
import 'package:firebaseusers/pages/change_password.dart';
import 'package:firebaseusers/pages/edit.dart';
import 'package:firebaseusers/pages/profile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          label: Text("Add Note "),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Add()));
          },
          backgroundColor: Colors.pink,
          icon: Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        centerTitle: true,
        title: Text(
          "My Notes",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'pacifico',
              color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.all_inclusive),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword()));
              }),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              })
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 155.1,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Notes')
                        .where('id', isEqualTo: user.uid.toString())
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: new CircularProgressIndicator()));
                        default:
                          return new ListView(
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return Column(
                                children: [
                                  new ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Edit(
                                                    documntId:
                                                        document.documentID,
                                                  )));
                                    },
                                    title: new Text(document['name']),
                                    subtitle: Text(
                                        "last ubdate on " + document['date']),
                                    trailing: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          Firestore.instance
                                              .collection("Notes")
                                              .document(document.documentID)
                                              .delete();
                                        }),
                                  ),
                                  Divider(
                                    color: Colors.redAccent,
                                  )
                                ],
                              );
                            }).toList(),
                          );
                      }
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
