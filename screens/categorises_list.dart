import 'package:flutter/material.dart';
import 'package:news_app/widgets/categorises_data.dart';
import '../widgets/widgets.dart';
class categorises_list extends StatelessWidget {
  const categorises_list({
    Key? key,
    required this.title
  }) : super(key: key);
  final title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          if(title == "International")
            international(),
          if(title == "Stock")
            stock(),
          if(title == "Sports")
            sports(),
          if(title == "Politics")
            politics(),
          if(title == "Hot News")
            hot(),
          if(title == "Weather")
            weather()

        ],
      ),
    );
  }
}
