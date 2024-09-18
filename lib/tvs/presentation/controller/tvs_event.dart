import 'package:show_box/core/app_imports/app_imports.dart';

abstract class TvsEvent extends Equatable{
 const TvsEvent();

 @override
  List<Object> get props => [];
}

class NowPlayingTvsEvent extends TvsEvent {}
class PopularTvsEvent extends TvsEvent {}
class TopRatedTvsEvent extends TvsEvent {}