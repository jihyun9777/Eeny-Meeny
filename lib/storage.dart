import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class Storage{
  List<String> names = [];
  List<dynamic> emp = [];

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('outer/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch(e) {
      print(e);
    }
  }

  Future<List<String>> listFilesURL(String folderName) async {
    firebase_storage.ListResult results = await storage.ref(folderName).listAll();
    List<String> resultURLs = [];

    // results.items.forEach((firebase_storage.Reference ref) {
    //   print('Found file: $ref');
    // });

    for (firebase_storage.Reference ref in results.items) {
      String url = await firebase_storage.FirebaseStorage.instance.ref(ref.fullPath).getDownloadURL();
      resultURLs.add(url);
      // print(url);
    }

    return resultURLs;
  }

  void listFiles(String folderName) async {
    firebase_storage.ListResult results = await storage.ref(folderName).listAll();
    names = [];

    for (firebase_storage.Reference ref in results.items) {
      String name = ref.name;
      names.add(name);
      print(names);
    }
  }

  Future<String> downloadURL(String imageName) async{
    String url = await storage.ref().child(imageName).getDownloadURL();
    return url;
  }

  Future<void> deleteFile(String folder, String fileName) async {
    // print(fileURL);
    // File file = new File(fileURL);
    // String fileName = file.path.split('/').last;
    // print(fileName);

    print(folder + '/' + fileName);
    storage.ref().child(folder + '/' + fileName).delete().then((res) {
      print("Delete Success");
    }).catchError((error) {
      print("Delete failed");
      print(error);
    });
  }

  // List<dynamic> listFiles(String folderName) {
  //   FirebaseStorage.instance.ref().child(folderName).listAll()
  //     .then((value) {
  //       print("Success loading list");
  //       return value;
  //     }).catchError((error) {
  //       print("Failed loading list");
  //       return emp;
  //     });
  //   return emp;
  // }
  //
  // String? downloadURL(String imageName) {
  //   FirebaseStorage.instance.ref().child(imageName).getDownloadURL()
  //     .then((value) {
  //       print ("Success download url");
  //       return value;
  //     }).catchError((error) {
  //       print ("Failed download url");
  //       return null;
  //     });
  //   return null;
  // }
}