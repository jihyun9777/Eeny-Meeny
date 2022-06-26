import 'package:flutter/material.dart';
import 'closet_page.dart';

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
                Image.asset(''),
              ]
            ),

            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ClosetPage()),
                    // );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(left: 80, top: 33),
                  ),
                  child: Text (
                    menu[0],
                    style: const TextStyle (
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ClosetPage()),
                    // );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(left: 80, top: 33),
                  ),
                  child: Text (
                    menu[1],
                    style: const TextStyle (
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ]
            ),
          ]
        );
      },
    );
  }
}