part of 'detail_body.dart';
class DetailsWidget extends StatelessWidget {
  final dynamic state;
  const DetailsWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    AppType appType = AppCubit.get(context).appType;
    return DetailsItem(
        name: appType == AppType.movies
            ? (state as MovieDetailsState).movieDetails!.name
            : (state as TvsDetailsState).tvsDetails!.name,
        releaseDate: appType == AppType.movies
            ? (state as MovieDetailsState).movieDetails!.releaseDate.split('-')[0]
            :(state as TvsDetailsState).tvsDetails!.releaseDate.split('-')[0],
        voteAverage: appType == AppType.movies
            ? (state as MovieDetailsState).movieDetails!.voteAverage / 2
            : (state as TvsDetailsState).tvsDetails!.voteAverage / 2,
        runTime: appType == AppType.movies
            ? _showDuration((state as MovieDetailsState).movieDetails!.runTime!)
            : _showDuration((state as TvsDetailsState).tvsDetails!.runTime!),
        overview: appType == AppType.movies
            ? (state as MovieDetailsState).movieDetails!.overview
            : (state as TvsDetailsState).tvsDetails!.overview,
        genres: appType == AppType.movies
            ? _showGenres((state as MovieDetailsState).movieDetails!.genres)
            : _showGenres((state as TvsDetailsState).tvsDetails!.genres));
  }
}
String _showGenres(List<Genres> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String _showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}