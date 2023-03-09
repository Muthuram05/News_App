import 'package:flutter/material.dart';
class help extends StatelessWidget {
  const help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Help"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text("How Can We Help You?"),
          Text(
            "It looks like you are experiencing problem with our sign up process.We are here to help so please get in touch with us"
          ),
          Card(
            elevation: 5,
            child: Column(
              children: [
                Text("Email Us")
              ],
            ),
          )
        ],
      ),
    );
  }
}
