import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object?> get props => [];
}

class PreloadDataEvent extends RootEvent {
  const PreloadDataEvent();

  @override
  List<Object?> get props => [];
}

class SearchDataEvent extends RootEvent {
  const SearchDataEvent({required this.search});

  final String? search;

  @override
  List<Object?> get props => [search ?? 0];
}
