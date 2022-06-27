import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'closet_page.dart';
import 'storage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final List<String> menu = <String> ['Outer', 'Top', 'Bottom', 'Dress', 'Shoes', 'Other'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white24,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                    height: 80,
                    width: 400,
                    child: Image.asset(
                      'asset/bar.jpg',
                      fit: BoxFit.cover,
                    ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Stack(

                ),
              ),
            ],
          ),
          bottomDetailsSheet(),
        ]
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(

      initialChildSize: 0.13,
      minChildSize: 0.13,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return ListView(
          //shrinkWrap: true,
          controller: scrollController,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 80,
                  width: 400,
                  child: Image.asset(
                    'asset/bar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  alignment: Alignment.center,
                  child: (
                    Image.asset(
                      'asset/door_handle.png',
                      scale: 4,
                    )
                  ),
                ),
              ]
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: Column(
                children: [
                  drawerList(),
                ],
              ),
            )
          ]
        );
      },
    );
  }

  Widget drawerList() {
    return Container(
      width: 400,
      height: 40,
      margin: EdgeInsets.only(left: 5),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: TextButton(
              onPressed: () {
                showClothes(menu[index]);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ClosetPage()),
                //   );
              },
              style: TextButton.styleFrom(
                //padding: const EdgeInsets.only(left: 80, top: 33),
              ),
              child: Text(
                menu[index],
                style: const TextStyle (
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Vonique',
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget showClothes(String menu){
    final Storage storage = Storage();
    storage.listFiles();

    return Container();

    // return FutureBuilder(
    //     future: storage.listFiles(),
    //     builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
    //         print("here");
    //         return Container(
    //           height: 400,
    //           child: ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: snapshot.data!.items.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return Text("Hello",
    //                 style: TextStyle(
    //                   fontSize: 30,
    //                   color: Colors.white,
    //                 ));
    //               }
    //           ),
    //         );
    //     }
    // );
  }
}