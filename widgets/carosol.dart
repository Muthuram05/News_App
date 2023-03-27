import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/categorises.dart';


class Carosol extends StatefulWidget {
  const Carosol({Key? key}) : super(key: key);

  @override
  State<Carosol> createState() => _CarosolState();
}

class _CarosolState extends State<Carosol> {
  List imageList=[
    {"id" : 1,"image_path" : 'lib/assets/sports.jpg'},
    {"id" : 2,"image_path" :'lib/assets/politics2.jpg'},
    {"id" : 3 ,"image_path" : 'lib/assets/weather.jpg',},
    {"id" : 4 ,"image_path" :'lib/assets/inter.jpg',},
    {"id" : 5 ,"image_path" : 'lib/assets/stock.jpg',},
    {"id" : 6 ,"image_path" :'lib/assets/hot.jpg',}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> const categorises()
            ));
          },
          child: CarouselSlider(
            items: imageList.map(
                  (item) => Image.asset(
                item['image_path'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ).toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index,reason){
                  setState(() {
                    currentIndex = index;
                  });
                }
            ),

          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            imageList.asMap().entries.map((e) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(e.key),
                child: Container(
                  width: currentIndex == e.key ? 17 : 7,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == e.key ? Colors.blue : Colors.white
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}





