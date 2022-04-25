import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:jobsheet7/models/movie.dart';

class HttpService {
  final String apiKey = '83ff2048f218da832f9e42984d124e32';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future <List?>getPopularMovies() async {

    final String uri = baseUrl + apiKey;

    // mengambil respone dari API
    http.Response result = await http.get(Uri.parse(uri));
    // cek succes or fail
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      // menampilkan error
      print("Fail");
      return null;
    }

  }

}