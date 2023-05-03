import 'package:flutter/material.dart';
import 'package:tmdb_movies/utils/text.dart';

class TV extends StatelessWidget {

  final List<dynamic>? tv;
  const TV({Key? key, required this.tv}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text( size: 25, text: 'Popular TV Shows Movies',color: Colors.white,),
          SizedBox(height: 10,),
          if (tv == null)
            Center(child: CircularProgressIndicator())
          else if (tv is List<dynamic>)
            Container(height: 200,

              child: ListView.builder(
                  itemCount: tv?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){

                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Container(

                              width: 250,
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                  image: NetworkImage(

                                    'http://image.tmdb.org/t/p/w500'+tv![index]['poster_path'],
                                  ), fit: BoxFit.cover,
                              )),
                            ),
                            SizedBox(height: 10, ),
                            Container(child: modified_text(text:tv![index]['original_name'] ?? 'Undefined title', color: Colors.white,size: 14,),)
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
