import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class help extends StatelessWidget {
  const help({Key? key}) : super(key: key);
  Future<void> _sendingMails() async {
    var url = Uri.parse("mailto:mr032495@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          Text(
            "How Can We Help You?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "It looks like you are experiencing problem with our sign up process.We are here to help so please get in touch with us"),
          ),
          InkWell(
            onTap: _sendingMails,
            child: Container(
                  height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10),
                  )
                ),
                  child: Card(
                    child:Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Click",style: TextStyle(fontSize: 15),
                            ),
                            Icon(Icons.arrow_right_alt),
                          ],
                        )),
                  )
            ),


          )
        ],
      ),
    );
  }
}
