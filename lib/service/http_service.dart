import 'dart:io';
import 'dart:convert';
import 'package:jobsheet7/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '83ff2048f218da832f9e42984d124e32';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future <String>getPopularMovies() async {

    final String uri = baseUrl + apiKey;

    // mengambil respone dari API
    http.Response result = await http.get(Uri.parse(uri));
    // cek succes or fail
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies.toString();
    } else {
      // menampilkan error
      print("Fail");
      String response = '';
      return response;
    }

  }

}