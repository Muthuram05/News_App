import 'package:flutter/material.dart';
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
                          backgroundImage: AssetImage("lib/assets/ram.jpg"),
                        ),
                        Text("Muthu Raman",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text("muthuram@gmail.com"),
                      Text("+91 7639490537"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width * 0.08,
              ),
              ListTile(
                leading: const Icon(Icons.bookmark),
                title: const Text(' Bookmark '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text(' Privacy '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text(' Language Settings '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(' Logout '),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        drawer: Navbar(),


    );
  }
}



