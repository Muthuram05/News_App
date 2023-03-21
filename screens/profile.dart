import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
              StreamBuilder<List<User>>(
                stream: readUsers(),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  else if(snapshot.hasData){
                    final users = snapshot.data!;
                    return ListView(
                      children: users.map(builduser).toList(),
                    );
                  }
                  else{
                    return Center(child:  CircularProgressIndicator(),);
                  }
                },
              ),
              // FutureBuilder<User?>(
              //   future: readUser(),
              //   builder: (context,snapshot){
              //     if(snapshot.hasData){
              //       final user = snapshot.data;
              //       return user== null ?
              //       Center(child: Text("No user"),) : builduser(user!);
              //     }
              //     else{
              //       return Center(child: CircularProgressIndicator(),);
              //     }
              //   },
              // ),
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
            ],
          ),
        ),
        drawer: const Navbar(),
    );
  }
  Widget builduser(User user)=> ListTile(
    title: Text('${user.name}'),
  );
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  // Future<User?> readUser() async{
  //   final docUser = FirebaseFirestore.instance.collection("users").doc("my-id");
  //   final snapshop = await docUser.get();
  //   if(snapshop.exists){
  //     return User.fromJson(snapshop.data()!);
  //   }
  // }
}

class User{
  final String id;
  final String name;
  final String age;
  User({
    this.id = '',
    required this.name,
    required this.age
  });

  static User fromJson(Map<String , dynamic > json) =>User(
    id : json['id'],
    name: json['name'],
    age : json['age']
  );
}






