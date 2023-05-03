import 'package:flutter/material.dart';
import 'package:tmdb_movies/utils/text.dart';

class TopRated extends StatelessWidget {

  final List<dynamic>? toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text( size: 25, text: 'Toprated Movies',color: Colors.white,),
          SizedBox(height: 10,),
          if (toprated == null)
            Center(child: CircularProgressIndicator())
          else if (toprated is List<dynamic>)
            Container(height: 270,
              child: ListView.builder(
                  itemCount: toprated?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){

                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(image: DecorationImage(
                                  image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+toprated![index]['poster_path'],
                                  )
                              )),
                            ),
                            Container(child: modified_text(text:toprated![index]['title'] ?? 'Undefined title', color: Colors.white,size: 14,),)
                          ],
                        ),
                      ),
                    );
                  }),)
        ],
      ),
    );
  }
}
