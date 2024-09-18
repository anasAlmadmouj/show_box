import 'package:show_box/core/app_imports/app_imports.dart';

class AppState extends Equatable {
  final RequestState requestState;

  const AppState(
      {this.requestState = RequestState.loading,});

  AppState copyWith({
    RequestState? requestState,
  }) {
    return AppState(
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState];
}
