import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Edit extends StatefulWidget {
  String title;
  String text;
  String documntId;

  Edit({
    @required this.title,
    @required this.text,
    @required this.documntId,
  });

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController _title = TextEditingController();
  TextEditingController _text = TextEditingController();
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

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          label: Text("Edit Note "),
          onPressed: () async {
            await Firestore.instance
                .collection('Notes')
                .document(widget.documntId)
                .updateData({
              'name': _title.text,
              'text': _text.text,
              'date': DateTime.now().toString(),
            });

            Fluttertoast.showToast(
                msg: " the note was ubdated",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          backgroundColor: Colors.pink,
          icon: Icon(Icons.add)),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit the note"),
        backgroundColor: Colors.red[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: _title,
                decoration: InputDecoration(
                  hintText: 'Please Enter title of  the note',
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.ac_unit),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue, width: 3),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: _text,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Enter the text of the note',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue, width: 3),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
