class Movie{
  int id;
  String title;
  double voteAvarage;
  String overview;
  String posterPath;

  Movie(this.id, this.title, this.voteAvarage, this.overview, this.posterPath);

  // conversi json
  Movie.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      voteAvarage = json['vote_average'] * 1.0,
      overview = json['overview'],
      posterPath = json['poster_path'];


}