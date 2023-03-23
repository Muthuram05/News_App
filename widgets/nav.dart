
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var username = "";
  @override
  void initState() {
    readUser();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
          children: [
             UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("lib/assets/user1.png"),
              ),
              accountName:  Text(username,style:TextStyle(color: Colors.black) ,),
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
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                navigatorKey.currentState!.popUntil((route)=>route.isFirst);
              }
            ),
          ],
        )
    );
  }
  readUser() async{
    final docUser = FirebaseFirestore.instance.collection("users").doc(user.uid);
    final snapshop = await docUser.get();
    if(snapshop.exists){
      setState(() {
        username = User.fromJson(snapshop.data()!).name;
      });
      // return User.fromJson(snapshop.data()!);
    }
  }

}
class User{
  String id;
  final String name;
  final String age;
  final String contact;
  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.contact
  });

  static User fromJson(Map<String , dynamic > json) =>User(
    age : json['age'],
    contact: json['contact'],
    name: json['name'],
  );
}


