import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object?> get props => [];
}

class FilterMovieEvent extends RootEvent {
  final Lang? filterLang;
  final String? search;
  final bool? filterWithPoster;

  const FilterMovieEvent(
      {this.filterWithPoster = false, this.search, this.filterLang});

  @override
  List<Object?> get props =>
      [filterLang ?? 0, filterWithPoster ?? 0, search ?? 0];
}

class PreloadDataEvent extends RootEvent {
  const PreloadDataEvent();

  @override
  List<Object?> get props => [];
}

class PaintFilterFieldEvent extends RootEvent {
  final Lang? radioBtnLang;
  final bool? checkBxWithPoster;

  const PaintFilterFieldEvent({this.checkBxWithPoster, this.radioBtnLang});

  @override
  List<Object?> get props => [radioBtnLang ?? 0, checkBxWithPoster ?? 0];
}
