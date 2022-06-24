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
            const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                )
            ),
            FlatButton(
              onPressed: () {

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClosetPage()),
                );
              },
              child: const Text (
                'Confirm',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.yellow
                ),
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