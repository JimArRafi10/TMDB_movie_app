import 'package:flutter/material.dart';
import 'package:tmdb_movies/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({Key? key, required this.name, required this.description, required this.bannerurl,
  required this.launch_on, required this.posterurl,required this.vote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover,),
                  )),
                  Positioned(
                      bottom: 10,
                      child: Text('⭐ '+'Average Rating - '+ vote,))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(padding: EdgeInsets.all(10),
            child: modified_text(text: name!= null? name: 'Not Loaded', size: 24, color: Colors.white,),)

          ,Container(padding: EdgeInsets.only(left: 10),
            child: modified_text(text: 'Releaseing On - '+launch_on,size: 14,color: Colors.white,),)
            ,Row(
              children: [
                
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                width: 100,
                child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modified_text(text: description,size: 18,color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
