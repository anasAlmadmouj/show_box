import 'package:show_box/core/app_imports/app_imports.dart';

class HorizontalListWidget<T> extends StatelessWidget {
  final List<T> list;
  const HorizontalListWidget({
    super.key, required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            // scrollDirection: Axis.vertical
          ),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final item = list[index];
            return AppCubit.get(context).appType == AppType.movies
                ? HorizontalListMoviesItem(item: (item as Movie))
                : HorizontalListTvsItem(item: (item as Tvs));
          },
        ),
      ),
    );
  }
}