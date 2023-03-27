import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screens/bookmark.dart';
import 'package:share/share.dart';

class details extends StatelessWidget {
  const details({
    Key? key,
    required this.image,
    required this.heading,
    required this.content,
    required this.id
  }) : super(key: key);

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
          child: Column(
              children: [
                Card(
                  child: Padding(
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
                         Row(
                          children: [
                            const SizedBox(
                              width: 200,
                              child: TextField(

                              ),
                            ),
                            ElevatedButton(
                                onPressed: (){},
                                child: Text("Submit"))
                          ],
                        ),
                        Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("lib/assets/ram.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("@muthuram@gmail.com",style: TextStyle(color: Colors.black45),),
                                Text("Yes, Thanks")
                              ],
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),


    );
  }
}
