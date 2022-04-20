import 'package:flutter/material.dart';
import 'package:jobsheet7/service/http_service.dart';
import 'package:jobsheet7/models/movie.dart';


class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<Movie> popularMovies;

  String result = "";
  // int moviesCount = 0;
  // List<String> movies = [];
  HttpService service = HttpService();

  Future initialize() async {
    result = await service.getPopularMovies();
    setState(() {
      popularMovies = result as Future<Movie>;
    });
  }

  @override
  void initState(){
    initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    service.getPopularMovies().then((value) {
      setState(() {
        result = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: Container(
        child: FutureBuilder<Movie>(
          future: popularMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}