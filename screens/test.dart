import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('comments').snapshots(),
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
                      title: Text(data['email']),
                      subtitle: Text(data['message']),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )
    );
  }
}
