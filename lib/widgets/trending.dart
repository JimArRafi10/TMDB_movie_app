import 'package:flutter/material.dart';
import 'package:tmdb_movies/description.dart';
import 'package:tmdb_movies/utils/text.dart';

class TrendingMovies extends StatelessWidget {

  final List<dynamic>? trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text( size: 25, text: 'Trending Movies',color: Colors.white,),
          SizedBox(height: 10,),
          if (trending == null)
            Center(child: CircularProgressIndicator())
          else if (trending is List<dynamic>)
          Container(height: 270,
          child: ListView.builder(
              itemCount: trending?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Description(name: trending![index]['title'],
                        description: trending![index]['overview'],
                        bannerurl: 'http://image.tmdb.org/t/p/w500'+trending![index]['poster_path'],
                        launch_on: trending![index]['release_date'],
                        posterurl: 'http://image.tmdb.org/t/p/w500'+trending![index]['poster_path'],
                        vote: trending![index]['vote_average'].toString())));

                  },
                  child:
                  trending![index]['title'] != null? Container(
                    width: 140,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(image: DecorationImage(
                            image: NetworkImage(
                              'http://image.tmdb.org/t/p/w500'+trending![index]['poster_path'],
                            )
                          )),
                        ),
                        Container(child: modified_text(text:trending![index]['title'] ?? 'Undefined title', color: Colors.white,size: 14,),)
                      ],
                    ),
                  ): Container(),
                );
              }),)
        ],
      ),
    );
  }
}
