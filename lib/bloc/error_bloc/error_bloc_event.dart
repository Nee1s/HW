import 'package:equatable/equatable.dart';

abstract class ErrorEvent extends Equatable {
  const ErrorEvent();

  @override
  List<Object?> get props => [];
}

class NoDataEvent extends ErrorEvent {
  const NoDataEvent();

  @override
  List<Object?> get props => [];
}

class EmptyDataEvent extends ErrorEvent {
  const EmptyDataEvent();

  @override
  List<Object?> get props => [];
}

class LoadingDataErrorEvent extends ErrorEvent {
  const LoadingDataErrorEvent({this.code, this.message});

  final String? code;
  final String? message;

  @override
  List<Object?> get props => [code ?? 0, message ?? 0];
}

class UnbelievableErrorEvent extends ErrorEvent {
  const UnbelievableErrorEvent({this.place});

  final String? place;

  @override
  List<Object?> get props => [];
}
