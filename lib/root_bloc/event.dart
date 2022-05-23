import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object?> get props => [];
}

class FilterMovieEvent extends RootEvent {
  final String? search;

  const FilterMovieEvent({this.search});

  @override
  List<Object?> get props => [search ?? 0];
}

class PreloadDataEvent extends RootEvent {
  const PreloadDataEvent();

  @override
  List<Object?> get props => [];
}
