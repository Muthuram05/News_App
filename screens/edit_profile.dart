import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({Key? key}) : super(key: key);
  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top:8.0,bottom: 8.0,left: 20.0,right: 20.0
        ),
        child: Column(
            children: [
              TextField(
               readOnly: true,
                controller: email,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: user.email!
                    ),
              ),
              TextField(

                controller: name,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Name',
                    hintText: 'Enter Your Name'),
              ),
              TextField(
                controller: phoneNo,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Phone No',
                    hintText: 'Enter Your Number'),
              ),
              TextField(
                controller: age,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Age',
                    hintText: 'Enter Your Age'),
              ),
              ElevatedButton(
                  onPressed: (){
                     final Name = name.text;
                     final PhoneNo = phoneNo.text;
                     final Age = age.text;
                     createUser(Name:Name,mobileNo: PhoneNo,Age :Age);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> profile()));
                  },
                  child: Text("Submit"))
            ],
        ),
      ),
    );
  }
  Future createUser({required String Name , required String mobileNo, required String Age}) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.uid!);
    final json = {
      'name' :Name,
      'age' : Age,
      'contact' : mobileNo,
    };
    await docUser.update(
        json
    );
  }
}
