
import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/screens.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(' Home '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text(' Categorises '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises()));
              },
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises()));

              } ,
              child: ListTile(
                leading: const Icon(Icons.bookmark),
                title: const Text(' Bookmark '),
                onTap: () {

                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text(' Profile '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> profile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.details),
              title: const Text(' Details '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> details()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit '),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(' Logout '),
              onTap: () {

              },
            ),
          ],

        )
    );
  }
}


