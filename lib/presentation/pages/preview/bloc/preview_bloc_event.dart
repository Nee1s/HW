import 'package:equatable/equatable.dart';

abstract class PreviewPEvent extends Equatable {
  const PreviewPEvent();

  @override
  List<Object?> get props => [];
}

class ReplaceViewEvent extends PreviewPEvent {
  final int changedTab;

  const ReplaceViewEvent({required this.changedTab});

  @override
  List<Object?> get props => [changedTab];
}
