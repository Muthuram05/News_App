import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/screens/profile.dart';

import '../main.dart';

class signup extends StatefulWidget {
  final Function() onClickedSignIn;
  const signup({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20.0),
        child: Form(
          key : formKey,
          child: Column(
              children: [
                SizedBox(
                  height:  MediaQuery.of(context).size.height * .2,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Enter Email',
                      hintText: 'Enter Your Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email)=>
                  email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Enter Password',
                      hintText: 'Enter Your Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)=>
                  value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,

                ),
                ElevatedButton(
                  onPressed: signUp,child: Text("Sign Up"),
                ),
                RichText(text: TextSpan(
                    text: 'Already Have an account ? ',
                    style: TextStyle(color: Colors.red,fontSize: 18),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Sign In',
                      )
                    ]
                ),
                )
              ],
            ),
          ),
      ),

    );
  }
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      final user = FirebaseAuth.instance.currentUser!;
      final docUser = FirebaseFirestore.instance.collection('users').doc(user.uid!);
      final json = {
        'name' : "User",
        'age' : "00/00/0000",
        'contact' : "0000000000",
        'profile' : "https://firebasestorage.googleapis.com/v0/b/newsapp-49d4e.appspot.com/o/image%2Fuser1.png?alt=media&token=8a31b66c-1bae-4317-917b-313130039b22"
      };
      await docUser.set(
          json
      );
      Fluttertoast.showToast(
          msg: "Account Successfully Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    on FirebaseException catch (e){
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}