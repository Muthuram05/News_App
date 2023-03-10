import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);
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
                        CircleAvatar(
                          maxRadius: 55,
                          minRadius: 55,
                          backgroundImage: AssetImage("lib/assets/user1.png"),
                        ),
                        Text("Unknown User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text("user@gmail.com"),
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
                leading: const Icon(Icons.help),
                title: const Text(' Help '),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> help()));
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(' Log Out '),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),

            ],
          ),
        ),
        drawer: const Navbar(),
    );
  }
}



