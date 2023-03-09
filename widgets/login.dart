import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
class login extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const login({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   @override
   void dispose(){
     emailController.dispose();
     passwordController.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Enter Email',
                hintText: 'Enter Your Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Enter Password',
                hintText: 'Enter Your Password'),
          ),
          ElevatedButton(
            onPressed: signIn,child: Text("Sign in"),
          ),
          RichText(text: TextSpan(
            style: TextStyle(color: Colors.red,fontSize: 24),
            text: 'No account ? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                ..onTap = widget.onClickedSignUp,
                text: 'Sign Up',
                style: const TextStyle(
                  decoration: TextDecoration.underline,

                )
              )
            ]
          ),
          ),

        ],
      ),
    );
  }
  Future signIn() async{
     showDialog(context: context,
         barrierDismissible: false,
         builder: (context) => Center(child: CircularProgressIndicator(),)
     );
     try{

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim()
      );
     }
     on FirebaseException catch(e){
       print(e);
     }
     navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}
