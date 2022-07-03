import 'package:flutter/material.dart';
import 'package:my_closet/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Eeny Meeny'))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  child: Text(
                    'Eeny Meeny',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 59.5,
                        fontFamily: 'Alex'
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Eeny Meeny',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Alex'
                    ),
                  ),
                ),
              ]
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('asset/launcher_icon.png')
            ),
          ]
        ),
      ),
    );
  }
}
