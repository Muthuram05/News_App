
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/screens.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
          children: [
             UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("lib/assets/user1.png"),
              ),
              accountName:  Text(user.email!,style:TextStyle(color: Colors.black) ,),
              accountEmail:  Text(user.email!,style: TextStyle(fontSize: 10,color: Colors.black45),),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(' Home '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text(' Categorises '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises()));
              },
            ),
           ListTile(
                leading: const Icon(Icons.help),
                title: const Text(' Help '),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> help()));
                },
              ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text(' Profile '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> profile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(' Logout '),
              onTap: ()=> FirebaseAuth.instance.signOut(),
            ),
          ],
        )
    );
  }
}


