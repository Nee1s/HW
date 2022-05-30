import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/bloc/error_bloc/error_bloc_event.dart';
import 'package:hw/bloc/error_bloc/error_bloc_state.dart';
import 'package:hw/components/dialogs/error_dialog.dart';

import 'error_bloc_event.dart';
import 'error_bloc_state.dart';

export 'error_bloc_event.dart';
export 'error_bloc_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(const ErrorState()) {
    on<EmptyDataEvent>(_onEmptyData);
    on<NoDataEvent>(_onNoData);
    on<LoadingDataErrorEvent>(_onLoadingDataError);
    on<UnbelievableErrorEvent>(_onUnbelievableError);
  }

  void _onNoData(NoDataEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(
        errorType: ErrorType.dataErrorType, error: ErrorMessage.noDataError);
  }

  void _onEmptyData(EmptyDataEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(
      errorType: ErrorType.dataErrorType,
      error: ErrorMessage.emptyDataError,
    );
  }

  void _onLoadingDataError(
      LoadingDataErrorEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(
        errorType: ErrorType.loadingDataErrorType,
        errorStr: '${event.code}: ${event.message}');
  }

  void _onUnbelievableError(
      UnbelievableErrorEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(
        errorType: ErrorType.unbelievableErrorType,
        error: ErrorMessage.unbelievableError,
        clarification:
            (event.place?.isNotEmpty ?? false ? '(${event.place})' : ''));
  }
}
