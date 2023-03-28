import 'package:flutter/material.dart';
import 'screens.dart';
import '../widgets/widgets.dart';

class bookmark extends StatelessWidget {
  const bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>  details(
                  id: null,
                    image:"lib/assets/sports.jpg" ,
                    heading: "Missile Attack in Tirunelveli",
                    content: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source."
                ),
              ));
            },
            child: const ListItem(
              image: "lib/assets/sports.jpg",
              heading: "Missile Attack in Tirunelveli",
              content: "Contrary to popular belief, Lorem Ipsum is not simply random text. ",
              date: "15/06/22",
              place: "Tirunelveli",
            ),
          ),
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>  details(
                  id: null,
                    image:"lib/assets/politics.jpg" ,
                    heading: "Missile Attack in tamil Nadu",
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                ),
              ));
            },
            child: const ListItem(
              image: "lib/assets/politics.jpg",
              heading: "Missile Attack in Uvari",
              content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              date: "17/06/22",
              place: "Chennai",
            ),
          ),
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>  details(
                  id: null,
                    image:"lib/assets/two.jpg" ,
                    heading: "Missile Attack in Uvari",
                    content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
                ),
              ));
            },
            child: const ListItem(
              image: "lib/assets/two.jpg",
              heading: "Missile Attack in Uvari",
              content: "It is a long established fact that a reader will be distracted by the readable content",
              date: "18/06/22",
              place: "Uvari",
            ),
          ),

        ],
      ),

    );
  }
}
