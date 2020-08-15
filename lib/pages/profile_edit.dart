import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseusers/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController _imgController = TextEditingController();
  bool _uploading = false;

  File _image;
  Future getImage(context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    var fileName = basename(image.path);
    setState(() {
      _uploading = true;
    });
    StorageReference firebaseStorage =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorage.putFile(image);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    final StorageReference storageReference =
        FirebaseStorage().ref().child(snapshot.storageMetadata.name);
    String imageLink = await storageReference.getDownloadURL();
    _imgController.text = imageLink;
    var user = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo updUser = new UserUpdateInfo();
    updUser.photoUrl = imageLink;
    await user.updateProfile(updUser);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Profile()));

    setState(() {
      _image = image;
      _uploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.brown[200], width: 1.5)),
            child: Column(
              children: [
                Text("الصور"),
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {
                    getImage(context);
                  },
                ),
                TextField(
                  controller: _imgController,
                  enabled: false,
                ),
                (_uploading)
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 0,
                      ),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: (_image != null)
                        ? Image.file(
                            _image,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                        : null)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
