import 'package:flutter/material.dart';
import 'package:hw/components/locale/locals.dart';
import 'package:hw/main.dart';

final BuildContext? _contextMainPage = Application.globalKey.currentContext;

void showErrorDialog({
  BuildContext? context,
  ErrorMessage? error,
  String? errorStr,
  ErrorType? errorType,
  String? clarification,
}) {
  final _context = context ?? _contextMainPage;
  if (_context != null) {
    showDialog(
      context: _context,
      builder: (context) => AlertDialog(
        title: Text(errorType?.toStr ?? ErrorType.unknownErrorType.toStr),
        content:
            Text(errorStr ?? error?.toStr ?? ErrorMessage.unknownError.toStr),
      ),
    );
  }
}

// static const String dataErrorType = 'Ошибка данных';
// static const String loadingDataErrorType = 'Ошибка загрузки данных';
// static const String unbelievableErrorType = 'Магия';
// static const String dataBaseUsageErrorType = 'Ошибка обращения к базе';
// static const String unknownErrorType = 'Неизвестный тип ошибки';
//
// static const String emptyDataError = 'Список рецептов пуст';
// static const String noDataError = 'Данные не пришли';
// static const String unbelievableError = 'Вы сделали невозможное! Поздравляю!';
// static const String dataBaseUsageOrderError =
//     'Неправаильный порядок обращения';
// static const String unknownError = 'Неизвестная ошибка';

enum ErrorType {
  dataErrorType,
  loadingDataErrorType,
  unbelievableErrorType,
  dataBaseUsageErrorType,
  unknownErrorType,
}

enum ErrorMessage {
  emptyDataError,
  noDataError,
  unbelievableError,
  dataBaseUsageOrderError,
  unknownError,
}

extension ErrorTypeToStr on ErrorType {
  String get toStr {
    switch (this) {
      case ErrorType.dataErrorType:
        return _contextMainPage?.locale.dataErrorType ?? '';
      case ErrorType.loadingDataErrorType:
        return _contextMainPage?.locale.loadingDataErrorType ?? '';
      case ErrorType.unbelievableErrorType:
        return _contextMainPage?.locale.unbelievableErrorType ?? '';
      case ErrorType.dataBaseUsageErrorType:
        return _contextMainPage?.locale.dataBaseUsageErrorType ?? '';
      default:
        return _contextMainPage?.locale.unknownErrorType ?? '';
    }
  }
}

extension ErrorMessageToStr on ErrorMessage {
  String get toStr {
    switch (this) {
      case ErrorMessage.emptyDataError:
        return _contextMainPage?.locale.emptyDataError ?? '';
      case ErrorMessage.noDataError:
        return _contextMainPage?.locale.noDataError ?? '';
      case ErrorMessage.unbelievableError:
        return _contextMainPage?.locale.unbelievableError ?? '';
      case ErrorMessage.dataBaseUsageOrderError:
        return _contextMainPage?.locale.dataBaseUsageOrderError ?? '';
      case ErrorMessage.unknownError:
        return _contextMainPage?.locale.unknownError ?? '';
    }
  }
}
