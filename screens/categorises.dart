import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class categorises extends StatelessWidget {
  const categorises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Categorises"),
        ),
        drawer: Navbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Card(
                      elevation: 5,
                      child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: Image.asset("lib/assets/one.jpg",fit: BoxFit.fill,),
                            ), //Container
                            Positioned(
                              bottom: 5,
                              left: 30,
                              child: Container(
                               child: const Text("Hot News",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                              ),
                            ),
                          ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            child: Image.asset("lib/assets/politics.jpg",fit: BoxFit.fill,),
                          ), //Container
                          Positioned(
                            bottom: 5,
                            left: 40,
                            child: Container(
                              child: Text("politics",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Card(
                    elevation: 5,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Image.asset("lib/assets/sports.jpg",fit: BoxFit.fill,),
                        ), //Container
                        Positioned(
                          bottom: 5,
                          left: 40,
                          child: Container(
                            child: Text("Sports",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Image.asset("lib/assets/stock.jpg",fit: BoxFit.fill,),
                        ), //Container
                        Positioned(
                          bottom: 5,
                          left: 40,
                          child: Container(
                            child: Text("Stock",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Card(
                    elevation: 5,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Image.asset("lib/assets/inter.jpg",fit: BoxFit.fill,),
                        ), //Container
                        Positioned(
                          bottom: 5,
                          left: 10,
                          child: Container(
                            child: const Text("International",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Image.asset("lib/assets/weather.jpg",fit: BoxFit.fill,),
                        ), //Container
                        Positioned(
                          bottom: 5,
                          left: 30,
                          child: Container(
                            child: Text("Weather",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

    );
  }
}
