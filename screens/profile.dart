import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class profile extends StatelessWidget {
  profile({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  late final userage;
  late final username;
  late final usernumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: Center(
          child: Column(
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
                              FutureBuilder<User?>(
                                future: readUser(),
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    final user = snapshot.data;
                                    return user== null ?
                                    Center(child: Text("No user"),) : builduser(user);
                                  }
                                  else if(snapshot.hasError){
                                    return Text(snapshot.hasError as String);
                                  }
                                  else{
                                    return Center(child: CircularProgressIndicator(),);
                                  }
                                },
                              ),
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
                        if(userage != null)
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              edit_profile(age:userage,phoneNo: usernumber,name: username,)));
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
        drawer: Navbar(),
    );
  }
  Widget builduser(User user)=> Column(
     children: [
       Text('${user.name}'),
       Text('${user.contact}')
     ],
   );


  Future<User?> readUser() async{
    final docUser = FirebaseFirestore.instance.collection("users").doc(user.uid);
    final snapshop = await docUser.get();
    if(snapshop.exists){
      userage = User.fromJson(snapshop.data()!).age;
      username = User.fromJson(snapshop.data()!).name;
      usernumber = User.fromJson(snapshop.data()!).contact;
      return User.fromJson(snapshop.data()!);
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






