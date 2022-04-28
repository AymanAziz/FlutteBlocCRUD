import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testaapril/Application%20Layer/Admin%20View/Index%20Admin.dart';

import 'Application Layer/User View/Index User.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

//create homepage for admin and user
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('Home Page'),
     ),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndexAdminPage()),
                );
              },
              child: const Text('Admin'),
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndexUserPage()),
                );
              },
              child: const Text('User'),
            ),
          ),
        ],
      ),
    );
  }
}

