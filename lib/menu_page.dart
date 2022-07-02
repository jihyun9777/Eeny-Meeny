import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  final List<String> menu = <String> ['outer', 'top', 'bottom', 'dress', 'shoes', 'other'];
  final Storage storage = Storage();
  late int menuCounter = 0;

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
                  children: [

                  ]
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
          shrinkWrap: true,
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
            Container(
              height: 500,
              width: 400,
              color: Colors.grey[800],
              child: Column(
                children: [
                  drawerList(),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 400,
                    height: 450,
                    child: FutureBuilder(
                      future: storage.listFiles(menu[menuCounter].toString()),
                      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                        print(menu[menuCounter]);
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: snapshot.data?.length, //
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              snapshot.data![index],
                            );
                          }
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
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
                //showClothes(index);
                menuCounter = index;
                setState(() {

                });
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

//   Widget showClothes(int index){
//     return FutureBuilder(
//         future: storage.listFiles(menu),
//         builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
//           return Container(
//             height: 400,
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   print("!!!!");
//                   return Image.network (
//                     snapshot.data![index],
//                   );
//                 }
//             ),
//           );
//         }
//     );
//
//     //outer
//     if(index == 0){
//       return const Text(
//         "data",
//         style: TextStyle(
//           fontSize: 30,
//           color: Colors.white,
//         ),
//       );
//
//       return GridView.count(
//         primary: false,
//         padding: const EdgeInsets.all(20),
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         crossAxisCount: 3,
//         children: [
//           Image.asset('asset.image.png'),
//         ],
//       );
//     }
//   }

}