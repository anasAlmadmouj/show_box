import 'package:show_box/core/app_imports/app_imports.dart';

class TvsDetailScreen extends StatelessWidget {
  final int id;

  const TvsDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => sl<TvsDetailsBloc>()
      ..add(GetTvsDetailsEvent(id))
      ..add(GetTvsRecommendEvent(id: id)),
      lazy: false,
      child: const Scaffold(
        body:  DetailBody(),
      ),
    );
  }
}