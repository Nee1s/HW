import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class RepaintFilterEvent extends SearchEvent {
  final bool? filterWithPoster;

  const RepaintFilterEvent({this.filterWithPoster = false});

  @override
  List<Object?> get props => [filterWithPoster ?? 0];
}
