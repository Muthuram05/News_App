import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {

  const ListItem({
    Key? key,
    required this.image,
    required this.heading,
    required this.content,
    required this.date,
    required this.place
  }) : super(key: key);
  final image;
  final heading;
  final content,date,place;
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
              width: MediaQuery.of(context).size.width * .25 ,
              height: MediaQuery.of(context).size.height * .1,
              child: Image.asset(image,fit: BoxFit.fill,),
            ),
            Container(
                width: MediaQuery.of(context).size.width * .48,
                height: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10) ),
                      Text(content,style: TextStyle(fontSize: 10)),
                    ],
                  ),
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width * .2,
                height: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(date,style: TextStyle(fontSize: 10),),
                      Text(place,style: TextStyle(fontSize: 10),),
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
