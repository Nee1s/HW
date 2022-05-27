import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class RepaintFilterEvent extends SearchEvent {
  final Lang? filterLang;

  final bool? filterWithPoster;

  const RepaintFilterEvent({this.filterWithPoster = false, this.filterLang});

  @override
  List<Object?> get props => [filterLang ?? 0, filterWithPoster ?? 0];
}
