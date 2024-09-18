part of 'detail_body.dart';
class MoreLikeWidget extends StatelessWidget {
  const MoreLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: Text(
            'More like this'.toUpperCase(),
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
