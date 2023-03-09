import 'package:flutter/material.dart';
import 'screens.dart';
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
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises_list(title: "International",)));
                        },
                        child: const categorises_item(
                          image:"lib/assets/inter.jpg" ,
                          heading: "International",
                        ),
                      ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises_list(title: "Stock",)));

                      },
                      child: const categorises_item(
                        image:"lib/assets/stock.jpg" ,
                        heading: "Stock",
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises_list(title: "Sports",)));
                    },
                    child: const categorises_item(
                      image:"lib/assets/sports.jpg" ,
                      heading: "Sports",
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises_list(title: "Politics",)));

                    },
                    child: categorises_item(
                      image:"lib/assets/politics.jpg" ,
                      heading: "Politics",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises_list(title: "Hot News",)));
                    },
                    child: const categorises_item(
                      image:"lib/assets/one.jpg" ,
                      heading: "Hot News",
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> categorises_list(title: "Weather",)));
                    },
                    child: const categorises_item(
                      image:"lib/assets/weather.jpg" ,
                      heading: "Weather",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

            ],
          ),
        ),

    );
  }
}
