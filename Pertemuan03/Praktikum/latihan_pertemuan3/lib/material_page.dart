import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Manis Manis Manja')),
        backgroundColor: Color.fromARGB(250, 193, 54, 54),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text('Home')),
            ListTile(title: Text('Settings'))
          ],
        ),
      ),
      body: const Center(
        child: Heading(
          text: 'Hello ULBI',
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Colors.lightBlueAccent,
      shape: CircleBorder(), child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ]),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;

  const Heading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}