import 'package:flutter/material.dart';
import 'widgets.dart';
import '../screens/screens.dart';

class international extends StatelessWidget {
  const international({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                details(image: "lib/assets/inter.jpg", heading: "Contrary to popular belief", content:  ".Contrary to popular belief, Lorem Ipsum is not simply random text,Contrary to popular belief, Lorem Ipsum is not simply random text",)));
              },
              child: ListItem(
                content: "Contrary to popular belief, Lorem Ipsum is not simply random text.",
                image: "lib/assets/inter.jpg",
                heading: "Contrary to popular belief",
                date: "18/06/22",
                place: "Tiruchirapalli",
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    details(image: "lib/assets/inter2.jpg", heading: "There are many variations ", content:  "Contrary to popular belief, Lorem Ipsum is not simply random text,Contrary to popular belief, Lorem Ipsum is not simply random text",)));
              },
              child: ListItem(
                content: "There are many variations of Lorem Ipsum available,but the random",
                image: "lib/assets/inter2.jpg",
                heading: "There are many variations ",
                date: "18/06/22",
                place: "Tirunelveli",
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    details(image: "lib/assets/inter3.jpg", heading: "The standard chunk of Lorem Ipsum used since the 1500s Lorem Ipsum ",content:  ".Contrary to popular belief, Lorem Ipsum is not simply random text,Contrary to popular belief, Lorem Ipsum is not simply random text",)));
              },
              child: ListItem(
                content: "The standard chunk of Lorem Ipsum used since the 1500s Lorem Ipsum ",
                image: "lib/assets/inter3.jpg",
                heading: "The standard chunk of Lorem",
                date: "25/06/22",
                place: "Salem",
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    details(image: "lib/assets/inter4.jpg", heading: "There are many variations of Lorem Ipsum available,but the random", content:  "There are many variations of Lorem Ipsum available,but the random,Lorem Ipsum is not simply random text",)));
              },
              child: ListItem(
                content: "There are many variations of Lorem Ipsum available,but the random",
                image: "lib/assets/inter4.jpg",
                heading: "There are many variations",
                date: "30/06/22",
                place: "Erode",
              ),
            ),
          ],

    );
  }
}

class stock extends StatelessWidget {
  const stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListItem(
          content: "Contrary to popular belief, Lorem Ipsum is not simply random text",
          image: "lib/assets/stock.jpg",
          heading: "Where does it come from?",
          date: "15/06/22",
          place: "Coimbatore",
        ),
        ListItem(
          content: "But I must explain to you how all this idea of denouncing",
          image: "lib/assets/stock2.jpg",
          heading: "1914 translation by Rackham",
          date: "18/06/22",
          place: "Dindigul",
        ),
        ListItem(
          content: "At vero eos accusamus eiusto odio dignissimos ducimus",
          image: "lib/assets/stock3.jpg",
          heading: "de Finibus Bonorum et Malorum",
          date: "25/06/22",
          place: "Karur",
        ),
        ListItem(
          content: "Now is the winter of our discontent",
          image: "lib/assets/stock4.jpg",
          heading: "Now is the winte",
          date: "25/06/22",
          place: "Tirunelveli",
        ),
      ],
    );
  }
}

class sports extends StatelessWidget {
  const sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListItem(
          content: "Contrary to popular belief, Lorem Ipsum is not simply random text",
          image: "lib/assets/sports.jpg",
          heading: "Where does it come from?",
          date: "15/06/22",
          place: "Coimbatore",
        ),
        ListItem(
          content: "But I must explain to you how all this idea of denouncing",
          image: "lib/assets/sports2.jpg",
          heading: "1914 translation by Rackham",
          date: "18/06/22",
          place: "Dindigul",
        ),
        ListItem(
          content: "At vero eos accusamus eiusto odio dignissimos ducimus",
          image: "lib/assets/sports3.jpg",
          heading: "de Finibus Bonorum et Malorum",
          date: "25/06/22",
          place: "Karur",
        ),
        ListItem(
          content: "Now is the winter of our discontent",
          image: "lib/assets/sports4.jpg",
          heading: "Now is the winte",
          date: "25/06/22",
          place: "Tirunelveli",
        ),
      ],
    );
  }
}

class politics extends StatelessWidget {
  const politics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListItem(
          content: "Contrary to popular belief, Lorem Ipsum is not simply random text",
          image: "lib/assets/politics.jpg",
          heading: "Where does it come from?",
          date: "15/06/22",
          place: "Coimbatore",
        ),
        ListItem(
          content: "But I must explain to you how all this idea of denouncing",
          image: "lib/assets/politics2.jpg",
          heading: "1914 translation by Rackham",
          date: "18/06/22",
          place: "Dindigul",
        ),
        ListItem(
          content: "At vero eos accusamus eiusto odio dignissimos ducimus",
          image: "lib/assets/politics3.jpg",
          heading: "de Finibus Bonorum et Malorum",
          date: "25/06/22",
          place: "Karur",
        ),
        ListItem(
          content: "Now is the winter of our discontent",
          image: "lib/assets/politics4.jpg",
          heading: "Now is the winte",
          date: "25/06/22",
          place: "Tirunelveli",
        ),
      ],
    );
  }
}

class hot extends StatelessWidget {
  const hot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListItem(
          content: "Contrary to popular belief, Lorem Ipsum is not simply random text",
          image: "lib/assets/hot.jpg",
          heading: "Where does it come from?",
          date: "15/06/22",
          place: "Coimbatore",
        ),
        ListItem(
          content: "But I must explain to you how all this idea of denouncing",
          image: "lib/assets/hot2.jpg",
          heading: "1914 translation by Rackham",
          date: "18/06/22",
          place: "Dindigul",
        ),
        ListItem(
          content: "At vero eos accusamus eiusto odio dignissimos ducimus",
          image: "lib/assets/hot3.jpg",
          heading: "de Finibus Bonorum et Malorum",
          date: "25/06/22",
          place: "Karur",
        ),
        ListItem(
          content: "Now is the winter of our discontent",
          image: "lib/assets/hot4.jpg",
          heading: "Now is the winte",
          date: "25/06/22",
          place: "Tirunelveli",
        ),
      ],
    );
  }
}

class weather extends StatelessWidget {
  const weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListItem(
          content: "Contrary to popular belief, Lorem Ipsum is not simply random text",
          image: "lib/assets/weather.jpg",
          heading: "Where does it come from?",
          date: "15/06/22",
          place: "Coimbatore",
        ),
        ListItem(
          content: "But I must explain to you how all this idea of denouncing",
          image: "lib/assets/weather2.jpg",
          heading: "1914 translation by Rackham",
          date: "18/06/22",
          place: "Dindigul",
        ),
        ListItem(
          content: "At vero eos accusamus eiusto odio dignissimos ducimus",
          image: "lib/assets/weather3.jpg",
          heading: "de Finibus Bonorum et Malorum",
          date: "25/06/22",
          place: "Karur",
        ),
        ListItem(
          content: "Now is the winter of our discontent",
          image: "lib/assets/weather4.jpg",
          heading: "Now is the winte",
          date: "25/06/22",
          place: "Tirunelveli",
        ),
      ],
    );
  }
}





