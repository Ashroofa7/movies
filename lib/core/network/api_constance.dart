class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '5205bede0abbc86b1773b4e75a9880fd';
  static const nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl (String path)=>'$baseImageUrl$path';
  static String getMovieDetails(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String getRecommendations(int recommendationsId) => '$baseUrl/movie/$recommendationsId/recommendations?api_key=$apiKey';

}
