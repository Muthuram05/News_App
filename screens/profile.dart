import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class profile extends StatelessWidget {
  profile({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: Padding(
          padding:  EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.08
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          maxRadius: 55,
                          minRadius: 55,
                          backgroundImage: AssetImage("lib/assets/user1.png"),
                        ),
                        Text(user.email!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(user.email!),
                      Text("+91 9990009999"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width * 0.08,
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Profile'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> edit_profile()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> privacy()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Account'),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  User? user = await FirebaseAuth.instance.currentUser;
                  user?.delete();
                  navigatorKey.currentState!.popUntil((route)=>route.isFirst);
                },
              ),
            ],
          ),
        ),
        drawer: const Navbar(),
    );
  }
 Future<User?> readUser() async{
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.uid!);
    final snapshot = await docUser.get();
    if(snapshot.exists){
      // return User.fromJson(snapshot.data()!);
    }
 }
}



