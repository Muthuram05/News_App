import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {


  const ListItem({
    Key? key,
    required this.image,
    required this.heading
  }) : super(key: key);
  final image;
  final heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .2,
              height: MediaQuery.of(context).size.height * .1,
              child: Image.asset(image,fit: BoxFit.fill,),
            ),
            Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10) ),
                      const Text("MissileattackinyemenMissileattack in yemen Missile attack in yemen",style: TextStyle(fontSize: 10)),
                    ],
                  ),
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width * .2,
                height: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("12/06/22",style: TextStyle(fontSize: 10),),
                      Text("Tirunelveli",style: TextStyle(fontSize: 10),),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
