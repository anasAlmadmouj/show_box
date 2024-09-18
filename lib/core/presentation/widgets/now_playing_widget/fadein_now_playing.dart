part of 'now_playing_widget.dart';
class FadeInNowPlaying<T> extends StatelessWidget {
  final List nowPlayingList;
  const FadeInNowPlaying({super.key, required this.nowPlayingList});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 320.0.h,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: nowPlayingList.map(
              (item) {
            return GestureDetector(
              key: const Key('openMovieMinimalDetail'),
              onTap: () {
                AppCubit.get(context).appType == AppType.movies ?
                navigateTo((context) , MovieDetailScreen(id: item.id),)
               : navigateTo((context) , TvsDetailScreen(id: item.id),);
              },
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // fromLTRB
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0, 0.3, 0.5, 1],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      height: 560.0,
                      imageUrl: ApiConstants.imageUrl(item.backdropPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.redAccent,
                                size: 16.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                'Now Playing'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
