import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividualDest extends StatelessWidget {
  final String title;
  final String description;

  IndividualDest(this.title, this.description);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromRGBO(20, 59, 84, 1),
            pinned: true,
            snap: true,
            elevation: 50,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              background: Image.asset(
                // https://img.onmanorama.com/content/dam/mm/en/travel/getting-about-kerala/Idukki/images/2018/11/26/munnar-trip.jpg
                description,
                // https://www.ekeralatourism.net/wp-content/uploads/2018/03/Alleppey.jpg
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
