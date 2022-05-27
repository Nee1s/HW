import 'package:equatable/equatable.dart';

class PreviewPState extends Equatable {
  final int? tabIndex;

  const PreviewPState({
    this.tabIndex = 0,
  });

  PreviewPState copyWith({
    int? tabIndex,
  }) =>
      PreviewPState(
        tabIndex: tabIndex ?? 0,
      );

  @override
  List<Object?> get props => [tabIndex ?? 0];
}
