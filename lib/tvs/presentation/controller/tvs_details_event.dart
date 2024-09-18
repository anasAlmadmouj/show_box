import 'package:show_box/core/app_imports/app_imports.dart';

abstract class TvsDetailsEvent extends Equatable{
 const TvsDetailsEvent();

 @override
  List<Object> get props => [];
}

class GetTvsDetailsEvent extends TvsDetailsEvent {
 final int id;
 const GetTvsDetailsEvent(this.id);
 @override
 List<Object> get props => [id];
}
class GetTvsRecommendEvent extends TvsDetailsEvent {
 final int id;
 const GetTvsRecommendEvent({required this.id});
 @override
 List<Object> get props => [id];
}