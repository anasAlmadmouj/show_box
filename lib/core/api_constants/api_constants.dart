class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'abc7848988c2dca0c7c5349f5361717f';
  static const String movieNowPlayingPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String moviePopularPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String movieTopRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static  String movieDetailsPath(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';
  static  String tvsDetailsPath(int tvsId) => '$baseUrl/tv/$tvsId?api_key=$apiKey';
  static  String recommendationPath(int movieId) => '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  static  String recommendationTvPath(int tvsId) => '$baseUrl/tv/$tvsId/recommendations?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
  static const String tvNowPlayingPath = '$baseUrl/tv/airing_today?api_key=$apiKey';
  static const String tvPopularPath = '$baseUrl/tv/popular?api_key=$apiKey';
  static const String tvTopRatedPath = '$baseUrl/tv/top_rated?api_key=$apiKey';

}