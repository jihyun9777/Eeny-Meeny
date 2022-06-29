import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

import 'storage.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Storage'),
      ),
      // body: Column(
      //   children: [
      //     Center(
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       final results = await FilePicker.platform.pickFiles(
          //         allowMultiple: false,
          //         type: FileType.custom,
          //         allowedExtensions: ['png', 'jpg'],
          //       );
          //       if(results == null) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             content: Text('No file selected'),
          //           )
          //         );
          //         return null;
          //       }
          //
          //       final path = results.files.single.path!;
          //       final fileName = results.files.single.name;
          //
          //       storage.uploadFile(path, fileName).then((value) => print('Done'));
          //     },
          //     child: const Text('Upload File'),
          //   ),
          // ),
          // FutureBuilder(
          //   future: storage.listFiles(),
          //   builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
          //     if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          //       return Container(
          //         height: 100,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           shrinkWrap: true,
          //           itemCount: snapshot.data!.items.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return ElevatedButton(
          //               onPressed: () {
          //
          //               },
          //               child: Text(snapshot.data!.items[index].name),
          //             );
          //           }
          //         ),
          //       );
          //     }
          //     if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          //       return const CircularProgressIndicator();
          //     }
          //     return Container();
          //   }
          // ),
          // FutureBuilder(
          //   future: storage.downloadURL('outer.jpg'),
          //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //     if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          //       return Container(
          //         width: 300,
          //         height: 250,
          //         child: Image.network(
          //           snapshot.data!,
          //           fit: BoxFit.cover,
          //         ),
          //
          //       );
          //     }
          //     if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          //       return const CircularProgressIndicator();
          //     }
          //     return Container();
          //   }
          // ),
        //],
      //),
    );
  }
}
