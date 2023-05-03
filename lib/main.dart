import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_movies/utils/text.dart';
import 'package:tmdb_movies/widgets/toprated.dart';
import 'package:tmdb_movies/widgets/trending.dart';
import 'package:tmdb_movies/widgets/tv.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
       debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green),
    );
  }

}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List trendingmovies = [];
  late List topratedmovies = [];
  late List tv =[];

  final String apikey = '81504edbe9a9b90818520f4374b41aac';

  final String readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTUwNGVkYmU5YTliOTA4MTg1MjBmNDM3NGI0MWFhYyIsInN1YiI6IjY0MzE3Y2U1MzEwMzI1MDEwMzZlZTRhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TmUpdApwKYuvcHoaCP2o9nNSP-jhPF0VbGHYG3vIelc';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));

    Map trendingresult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithCustomLogs.v3.tv.getPopular();

    if(trendingresult != null) {
      setState(() {
        trendingmovies = trendingresult['results'];
        //topratedmovies = topratedresult['result'];
        //tv = tvresult['result'];
      });
    }

    if(topratedresult != null) {
      setState(() {
        topratedmovies = topratedresult['results'];
      });
    }

    if(tv != null) {
      setState(() {
        tv = tvresult['results'];
      });
    }

    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title:  modified_text(text:'TMDB Movie App', color: Colors.white, size: 23),),
     body: trendingmovies == null
        ? Center(child: CircularProgressIndicator(),)
     : ListView(
       children: [
         if(tv != null) TV(tv: tv),
         if(topratedmovies != null) TopRated(toprated: topratedmovies,),
         if (trendingmovies != null) TrendingMovies(trending: trendingmovies)
       ],
     ),
    );
  }
}
