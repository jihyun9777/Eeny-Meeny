import 'package:flutter/material.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
import 'closet_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  BottomDrawerController controller = BottomDrawerController();

  final List<String> menu = <String> ['Outer', 'Top', 'Bottom', 'Dress', 'Shoes', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(
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
            flex: 8,
            child: Stack(

            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                SizedBox(
                  height: 80,
                  width: 400,
                  child: Image.asset(
                    'asset/bar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.open();
                    print("open drawer");
                  }
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: Text("Here"),
      /// your customized drawer body.
      body: Text("Here"),
      /// your customized drawer header height.
      headerHeight: 60.0,
      /// your customized drawer body height.
      drawerHeight: 180.0,
      /// drawer background color.
      color: Colors.lightBlue,
      /// drawer controller.
      controller: controller,
    );
  }
}