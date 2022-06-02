import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final bool? chkBxPoster;

  const SearchState({
    this.chkBxPoster = false,
  });

  SearchState copyWith({
    bool? chkBxPoster,
  }) =>
      SearchState(
        chkBxPoster: chkBxPoster ?? this.chkBxPoster,
      );

  @override
  List<Object?> get props => [chkBxPoster ?? 0];
}
