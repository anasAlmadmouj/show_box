import 'package:show_box/core/app_imports/app_imports.dart';

class DetailsItem extends StatelessWidget {
  final String name;
  final String releaseDate;
  final double voteAverage;
  final String runTime;
  final String overview;
  final String genres;
  const DetailsItem({super.key, required this.name, required this.releaseDate, required this.voteAverage, required this.runTime, required this.overview, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: GoogleFonts.poppins(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  )),
              8.height,
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      releaseDate,
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  16.width,
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text( (voteAverage / 2).toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      4.width,
                      Text(
                        voteAverage.toString(),
                        style: const TextStyle(
                          fontSize: 1.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  16.width,
                  Text(
                    runTime,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              20.height,
              Text(
                overview,
                style: TextStyle(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              8.height,
              Text(
                'Genres: $genres)',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
