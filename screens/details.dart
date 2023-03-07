import 'package:flutter/material.dart';
import 'package:news_app/main.dart';




class details extends StatelessWidget {
  const details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("News App"),
          leading: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
              },
              child: Icon(Icons.keyboard_arrow_left)),),
        body: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: Image.asset("lib/assets/weather.jpg",fit: BoxFit.fill,),
                      ),
                      Text("Clear with periodic clouds"),
                      Divider(thickness: 2,),
                      Text("Chennai, Tamil Nadu, India Weather Forecast, with current conditions, wind, air quality, and what to expect for the next 3 days."),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.share,color: Colors.black,size: 35,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.facebook,color: Colors.blue,size: 35,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.mail,color: Colors.red,size: 35,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.youtube_searched_for,color: Colors.green,size: 35,),
                          ),
                        ],
                      ),
                  Divider(),
                  Text("Comments",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("lib/assets/ram.jpg"),
                          ),
                          Text("Yes, Thanks")
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
