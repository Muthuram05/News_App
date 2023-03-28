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
  var Profile = "https://firebasestorage.googleapis.com/v0/b/newsapp-49d4e.appspot.com/o/file%2F200w.gif?alt=media&token=b1495033-0815-446e-9c33-f4a34bf27922";
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
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(Profile),
              ),
              accountName:  Text(username.toUpperCase(),style: TextStyle(fontSize: 12,color: Colors.black),),
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
        Profile = User.fromJson(snapshop.data()!).profile;
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
  final String profile;
  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.contact,
    required this.profile
  });

  static User fromJson(Map<String , dynamic > json) =>User(
    age : json['age'],
    contact: json['contact'],
    name: json['name'],
    profile : json['profile']
  );
}


