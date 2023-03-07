import 'package:flutter/material.dart';
import 'package:news_app/widgets/nav.dart';
import 'widgets/widgets.dart';
import 'screens/screens.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("News App"),
        ),
        body: MyHomePage(),
        drawer: Drawer(

          child:Navbar()
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            color: Colors.white,
            child: MainCarousel(),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> details()));
            },
            child: Text("hii"),
          ),
          ListItem(image: "lib/assets/one.jpg", heading: "Missile Attack in Tirunelveli",),
          ListItem(image: "lib/assets/two.jpg",heading: "Missile Attack in Uvari",),
          ListItem(image: "lib/assets/three.jpg",heading: "Missile Attack in Chennai",),
          ListItem(image: "lib/assets/two.jpg",heading: "Missile Attack in Madras",),
          ListItem(image: "lib/assets/three.jpg",heading: "Missile Attack in Affrica",),
          ListItem(image: "lib/assets/one.jpg",heading: "Missile Attack in Usa",),
          ListItem(image: "lib/assets/three.jpg",heading: "Missile Attack in Chinna",),



        ],
      ),
    );
  }
}

