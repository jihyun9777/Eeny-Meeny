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
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 80,
                      child: SizedBox(
                        height: 700,
                        width: 300,
                        child: Image.asset(
                          'asset/wall.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 102,
                                child: Image.asset(
                                  'asset/drawer.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ClosetPage()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 6, right: 5, top: 33, bottom: 30),
                                ),
                                child: Text (
                                  menu[0],
                                  style: const TextStyle (
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              )
                            ]
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height: 101,
                                child: Image.asset(
                                  'asset/drawer.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 20, right: 5, top: 33, bottom: 30),
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
                          Stack(
                            children: [
                              SizedBox(
                                height: 101,
                                child: Image.asset(
                                  'asset/drawer.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 1, top: 34),
                                ),
                                child: Text (
                                  menu[2],
                                  style: const TextStyle (
                                    color: Colors.white,
                                    fontSize: 29,
                                  ),
                                ),
                              ),
                            ]
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height: 101,
                                child: Image.asset(
                                  'asset/drawer.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 5, top: 33),
                                ),
                                child: Text (
                                  menu[3],
                                  style: const TextStyle (
                                    color: Colors.white,
                                    fontSize: 29,
                                  ),
                                ),
                              ),
                            ]
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height: 101,
                                child: Image.asset(
                                  'asset/drawer.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 8, right: 5, top: 33, bottom: 30),
                                ),
                                child: Text (
                                  menu[4],
                                  style: const TextStyle (
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ]
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height: 101,
                                child: Image.asset(
                                  'asset/drawer.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 8, right: 5, top: 33, bottom: 30),
                                ),
                                child: Text (
                                  menu[5],
                                  style: const TextStyle (
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ]
                      ),
                    ),
                  ],
                ),
              ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}