import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/test.dart';
import 'package:share/share.dart';

class details extends StatelessWidget {
  details({
    Key? key,
    required this.image,
    required this.heading,
    required this.content,
    required this.id
  }) : super(key: key);
  final commentKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;
  final controller = TextEditingController();
  final image;
  final heading;
  final content;
  final id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("News App"),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.keyboard_arrow_left)),),
        body: SingleChildScrollView(
          child:Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Image.asset(image,fit: BoxFit.fill,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text(content),
                          ),
                          const Divider(thickness: 2,),
                          Text(heading),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      Share.share("News App\n \nHeading : $heading\n \nContent : $content");
                                    },
                                      child: const Icon(Icons.share,color: Colors.black,size: 35,)),
                                ),
                              ),
                            ],
                          ),
                      Divider(),
                      const Text("Comments",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,)),
                          const SizedBox(
                            height: 20,
                          ),
                           Form(
                             key: commentKey,
                             child: Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    controller: controller,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value)=>
                                    value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: comment,
                                    child: const Text("Comment"))
                              ],
                          ),
                           ),
                          Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance.collection('comments').where("post_id",isEqualTo: id).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                              if (snapshot.hasData) {
                                final docs = snapshot.data!.docs;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: docs.length,
                                  itemBuilder: (_, i) {
                                    final data = docs[i].data();
                                    return ListTile(
                                      leading: Icon(Icons.comment),
                                      title: Text(data['email']),
                                      subtitle: Text(data['message']),
                                    );
                                  },
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          )
                        ],
                      ),
                    ),
                ],
              ),
          ),
    );
  }
  comment(){
    final isValid = commentKey.currentState!.validate();
    if(!isValid) return;
    final contant = controller.text.trim();
    if(contant.isEmpty)
      return Null;
    newComment(Contant:contant);
  }

  Future newComment({required String Contant}) async{
    final docUser = FirebaseFirestore.instance.collection('comments').doc();
    final json = {
      'post_id' : id,
      'message' :Contant,
      'email' : user.email
    };
    await docUser.set(
        json
    );
    controller.text = "";
  }
}
