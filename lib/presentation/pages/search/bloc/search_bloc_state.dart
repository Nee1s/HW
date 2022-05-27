import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

class SearchState extends Equatable {
  final Lang? radioBLang;
  final bool? chkBxPoster;

  const SearchState({
    this.radioBLang = Lang.err,
    this.chkBxPoster = false,
  });

  SearchState copyWith({
    Lang? radioBLang,
    bool? chkBxPoster,
  }) =>
      SearchState(
        radioBLang: radioBLang ?? this.radioBLang,
        chkBxPoster: chkBxPoster ?? this.chkBxPoster,
      );

  @override
  List<Object?> get props => [radioBLang ?? 0, chkBxPoster ?? 0];
}
