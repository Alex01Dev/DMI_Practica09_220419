import 'package:dio/dio.dart';
import 'package:cinemapedia_220419/config/constants/environment.dart';
import 'package:cinemapedia_220419/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220419/infrastructure/mappers/movie_mapper.dart';
//import 'package:cinemapedia_220419/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia_220419/domain/entities/movie.dart';
import 'package:cinemapedia_220419/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies =
        movieDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    try {
      final response = await dio.get(
        '/movie/now_playing',
        queryParameters: {'page': page},
      );
      final movieDBResponse = MovieDbResponse.fromJson(response.data);
      final List<Movie> movies =
          movieDBResponse.results
              .where((moviedb) => moviedb.posterPath != 'no-poster')
              .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
              .toList();
      return movies;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        movieDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        movieDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        movieDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getMexican({int page = 1}) async {
    final response = await dio.get(
      '/discover/movie',
      queryParameters: {
        'page': page,
        'withOriginalLanguage': 'es',
        'with_origin_country': 'MX',
        'region': 'MX',
        'sort_by': 'vote_average.desc',
        'vote_count.gte': 10,
      },
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        movieDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();
    return movies;
  }
  
  @override
  Future<List<Movie>> getMovieById({int page = 1}) {
    throw UnimplementedError();
  }


}
