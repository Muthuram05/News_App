import 'package:flutter/material.dart';

class categorises_item extends StatelessWidget {
  const categorises_item({
    Key? key,
    required this.image,
    required this.heading

  }) : super(key: key);
  final image,heading;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset(image,fit: BoxFit.fill,),
          ), //Container
          Container(
            child: Text(heading,style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
