import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloWorldApp(),
    );
  }
}

class HelloWorldApp extends StatefulWidget {
  const HelloWorldApp({super.key});

  @override
  HelloWorldAppState createState() => HelloWorldAppState();
}

class HelloWorldAppState extends State<HelloWorldApp> {
  List<String> myArray = [];

  void addHelloWorld() {
    setState(() {
      myArray.add("Hello, World!");
    });
  }

  void removeHelloWorld() {
    setState(() {
      if (myArray.isNotEmpty) {
        myArray.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: myArray.map((message) {
                return Text(
                  message,
                  style: TextStyle(fontSize: 24),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: addHelloWorld,
                  child: Text('+'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: removeHelloWorld,
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addHelloWorld,
        tooltip: 'Add Hello World',
        child: Icon(Icons.add),
      ),
    );
  }
}
