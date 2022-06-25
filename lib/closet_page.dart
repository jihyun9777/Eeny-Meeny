import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ClosetPage extends StatefulWidget {
  const ClosetPage({Key? key}) : super(key: key);
  @override
  State<ClosetPage> createState() => _ClosetPageState();
}

class _ClosetPageState extends State<ClosetPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var clothesList = [];

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      uploadFileToFBStorage(imageFile);
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxHeight: 1800,
      maxWidth: 1800,
    );
    if(pickedFile != null) {
      File imageFile = File(pickedFile.path);
      uploadFileToFBStorage(imageFile);
      print("success photo");
    }
    else{
      print("failed photo");
    }
  }

  void uploadFileToFBStorage(File file) {
    var fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
    final storageRef = FirebaseStorage.instance.ref().child("Outer/" + fileName).putFile(file)
      .then((res) {
        print("Success upload");
    }).catchError((error) {
        print("Faild upload");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 100,
              height: 100,
              child: Image(
                //image: NetworkImage('https://tamaraday.com/wp-content/uploads/2019/07/Icon-Placeholder.png')
                  image: AssetImage('asset/image.png')
              ),
            ),
            Container(
              width: 350,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                  'My Demo App 2',
                  style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      backgroundColor: Colors.green
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 10),
              color: Colors.blue,
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
                controller: usernameController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                )
            ),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                )
            ),
            FlatButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("Outer").add(
                  {
                    "outer": usernameController.text,

                  }
                ).then((value) {
                  print("Success");
                }).catchError((error) {
                  print("Fail");
                  print(error);
                });
              },
              child: const Text (
                'Confirm',
                style: TextStyle (
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword
                  (email: usernameController.text, password: passwordController.text)
                    .then((value) {
                  print("Successfully sign up");
                }).catchError((error) {
                  print("Failed to sign up");
                  print(error.toString());
                });

              },
              child: const Text (
                'Confirm',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.yellow
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                clothesList = [];
                FirebaseFirestore.instance.collection("Outer").get()
                    .then((querySnapshot) {
                      print("Successfully load");
                      querySnapshot.docs.forEach((element) {
                        print(element.data());
                        clothesList.add(element.data());
                      });
                      setState(() {

                      });
                }).catchError((error) {
                  print("Error");
                  print(error);
                });
              },
              child: const Text (
                'Confirm',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.yellow
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _getFromGallery();
              },
              child: const Text (
                'Pick an Image',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.yellow
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _getFromCamera();
              },
              child: const Text (
                'Take a Photo',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.yellow
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: clothesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber[500],
                      child: Center(child: Text('${clothesList[index]}')),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.access_time_filled),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}