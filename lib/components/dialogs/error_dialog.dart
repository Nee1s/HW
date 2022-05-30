import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart';
import 'package:hw/presentation/pages/preview/preview_page.dart';

/// Функция вызова диалога ошибки
void showErrorDialog({
  BuildContext? context,
  String? error,
  String? errorType,
}) {
  final _context = context ?? PreviewPage.globalKey.currentContext;
  if (_context != null) {
    showErrorDialog(
      context: _context,
      error:
          '${errorType ?? RecipeLocal.unknownErrorType} - ${error ?? RecipeLocal.unknownError}',
    );
  }
}
