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
  //late imageToggle toggle;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      uploadFileToFBStorage(imageFile, menu[menuCounter].toString());
      print("success gallery photo");
    }
    else{
      print("failed gallery photo");
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
      uploadFileToFBStorage(imageFile, menu[menuCounter].toString());
      print("success photo");
    }
    else{
      print("failed photo");
    }
  }

  void uploadFileToFBStorage(File file, String folder) {
    var fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";

    FirebaseStorage.instance.ref().child("$folder/$fileName").putFile(file)
        .then((res) {
      print("Success upload");
    }).catchError((error) {
      print("Faild upload");
      print(error);
    });
  }

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
                    Container(

                    )
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
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: 400,
                        height: 450,
                        child: FutureBuilder(
                          future: storage.listFiles(menu[menuCounter].toString()),
                          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                            //print(menu[menuCounter]);
                            //var toggle = List<bool>.filled(snapshot.data!.length, false, growable: true);

                            return GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: snapshot.data?.length, //
                              itemBuilder: (BuildContext context, int index) {

                                return GestureDetector(
                                  onTap: () {
                                    //_isSelected = true;
                                    setState(() {

                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        snapshot.data![index],
                                      ),
                                      Visibility(
                                        visible: false,
                                        child: ListView(
                                          children: [
                                            TextButton(
                                              onPressed: () {

                                              },
                                              child: const Text (
                                                "Add",
                                                style: TextStyle(
                                                  fontSize: 30
                                                ),
                                              )
                                            )
                                          ],
                                        )
                                      )
                                    ]
                                  ),
                                );
                              }
                            );
                          }
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.only(top:400, right: 10),
                        child: FloatingActionButton(
                          tooltip: "Add from camera",
                          onPressed: () {
                            _getFromCamera();
                            setState(() {

                            });
                          },
                          backgroundColor: Colors.grey[850],
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.only(top:335, right: 10),
                        child: FloatingActionButton(
                          tooltip: "Add from Gallery",
                          onPressed: () {
                            _getFromGallery();
                            drawerList();
                          },
                          backgroundColor: Colors.grey[850],
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]
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